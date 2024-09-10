import 'package:http/http.dart' as http;
import 'package:json_native/json_native.dart';

import 'open_ai_settings.dart';

class OpenAiRepository {
  static const _promptExpandPrompt = """
You are an AI Assistant specialized in converting brief user ideas into detailed, comprehensive prompts for text-to-image generation. Your task is to take a user's input, which may be a simple concept or a short description, and transform it into a rich, descriptive prompt that can be used with text-to-image AI models.

Follow these guidelines:
1. Analyze the user's input to understand the core concept or subject.
2. Expand on the idea by adding relevant details, such as:
   - Specific visual elements
   - Textures and materials
   - Environmental context
   - Character descriptions (if applicable)
3. Suggest an artistic style that complements the concept (e.g., photorealistic, impressionist, digital art, etc.).
4. Incorporate composition elements (e.g., foreground, background, perspective).
5. Propose lighting and color schemes that enhance the mood or atmosphere.
6. Maintain the essence and intent of the original idea throughout your expansion.

Your output should be nothing but the generated prompt, encapsulated in a code block. Do not include any explanations, introductions, or additional text outside the code block.

Example user input: "A cat in a spaceship"

Your response should be in this format:
```
A curious tabby cat floating weightlessly inside a futuristic spaceship cockpit. The cat wears a custom-fitted space helmet. Holographic displays surround the feline, casting a blue glow. Earth is visible through a large, curved window. Hyper-realistic digital art style. Dynamic composition with the cat in the foreground and space in the background. Dramatic lighting with stars reflecting in the cat's eyes.
```

Remember, your goal is to create a vivid, detailed prompt that captures and expands upon the user's original idea, providing enough information for a text-to-image AI to generate a compelling visual representation.
""";

  final OpenAiSettingsPreference preference;

  OpenAiRepository(this.preference);

  OpenAiSettings get settings => preference.value;

  Future<String> call({
    required String systemPrompt,
    required String prompt,
    double? temperature,
    double? topP,
    int? maxTokens,
  }) async {
    final response = await http.post(
      settings.buildUri(),
      headers: settings.buildHeaders(),
      body: jsonEncode(
        {
          "messages": [
            {
              "role": "system",
              "content": systemPrompt,
            },
            {"role": "user", "content": prompt},
          ],
          if (temperature != null) "temperature": temperature,
          if (topP != null) "top_p": topP,
          if (maxTokens != null) "max_tokens": maxTokens,
        },
      ),
    );

    if (response.statusCode != 200) {
      throw Exception('Http Error: ${response.statusCode}');
    }

    try {
      final json = jsonDecodeCast<JsonObject>(response.body);
      return json
          .getList<JsonObject>("choices")[0]
          .getObj("message")
          .get<String>("content");
    } catch (ex) {
      throw Exception('Json Error: ${response.body}');
    }
  }

  Future<String> promptExpand(String prompt) async {
    final rawResult = await call(
      systemPrompt: _promptExpandPrompt,
      prompt: prompt,
      temperature: 0.7,
    );

    final matches = RegExp("```(.*?)```", multiLine: true, dotAll: true)
        .allMatches(rawResult);
    if (matches.isEmpty) {
      throw Exception('Parsing Error: $rawResult');
    }
    final result = matches.first.group(1);
    if (result == null) {
      throw Exception('Parsing Error: $rawResult');
    }
    return result;
  }
}
