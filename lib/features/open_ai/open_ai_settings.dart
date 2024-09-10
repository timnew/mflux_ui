import 'package:app_preference/app_preference.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'open_ai_settings.freezed.dart';
part 'open_ai_settings.g.dart';

@freezed
class OpenAiSettings with _$OpenAiSettings {
  const OpenAiSettings._();

  const factory OpenAiSettings.none() = _None;

  const factory OpenAiSettings.openAi({
    required String apiKey,
    String? organization,
  }) = _OpenAiSettings;

  const factory OpenAiSettings.azure({
    required String apiKey,
    required String endpoint,
    required String deployment,
  }) = _AzureSettings;

  factory OpenAiSettings.fromJson(Map<String, dynamic> json) =>
      _$OpenAiSettingsFromJson(json);

  Uri buildUri() => map(
        none: (_) => throw Exception("OpenAI settings are not set"),
        openAi: (settings) => Uri.parse(
          "https://api.openai.com/v1/chat/completions",
        ),
        azure: (settings) => Uri.parse(
          "https://${settings.endpoint}/openai/deployments/${settings.deployment}/chat/completions?api-version=2024-02-15-preview",
        ),
      );

  Map<String, String> buildHeaders() => map(
        none: (_) => throw Exception("OpenAI settings are not set"),
        openAi: (settings) => {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${settings.apiKey}",
          if (settings.organization != null)
            "OpenAI-Organization": settings.organization!,
        },
        azure: (settings) => {
          "Content-Type": "application/json",
          "api-key": settings.apiKey,
        },
      );
}

typedef OpenAiSettingsPreference = AppPreference<OpenAiSettings>;
