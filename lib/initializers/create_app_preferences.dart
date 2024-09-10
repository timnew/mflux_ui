import 'package:app_preference/app_preference.dart';
import 'package:mfluxui/features/generation.dart';
import 'package:mfluxui/features/open_ai.dart';
import 'package:mfluxui/features/output.dart';

OpenAiSettingsPreference createOpenAiSettingsPreference(
  AppPreferenceAdapter adapter,
) =>
    AppPreference.serialized(
      adapter: adapter,
      key: 'open_ai_settings',
      defaultValue: const OpenAiSettings.none(),
      serializer: (settings) => settings.toJson(),
      deserializer: OpenAiSettings.fromJson,
    );

GenerationOptionsPreference createGenerationOptionsPreference(
  AppPreferenceAdapter adapter,
) =>
    AppPreference.serialized(
      adapter: adapter,
      key: 'generation_options',
      defaultValue: GenerationOptions.defaultOptions,
      serializer: (options) => options.toJson(),
      deserializer: GenerationOptions.fromJson,
    );

OutputSettingsPreference createOutputSettingsPreference(
  AppPreferenceAdapter adapter,
) =>
    AppPreference.serialized(
      adapter: adapter,
      key: 'output_settings',
      defaultValue: OutputSettings.defaultSettings,
      serializer: (settings) => settings.toJson(),
      deserializer: OutputSettings.fromJson,
    );
