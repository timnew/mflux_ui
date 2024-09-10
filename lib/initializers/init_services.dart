import 'package:app_preference/app_preference_plugin_interface.dart';
import 'package:app_preference_shared_preferences/app_preference_shared_preferences.dart';
import 'package:mfluxui/features/find_service.dart';
import 'package:mfluxui/features/open_ai.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'create_app_preferences.dart';

Future<void> initServices() async {
  findService.registerSingletonAsync(() => SharedPreferences.getInstance());
  findService.registerSingletonWithDependencies<AppPreferenceAdapter>(
    () => SharedPreferencesAdapter(findService()),
    dependsOn: [SharedPreferences],
  );

  findService.registerSingletonWithDependencies(
    () => createOpenAiSettingsPreference(findService()),
    dependsOn: [SharedPreferencesAdapter],
  );
  findService.registerSingletonWithDependencies(
    () => createGenerationOptionsPreference(findService()),
    dependsOn: [SharedPreferencesAdapter],
  );
  findService.registerSingletonWithDependencies(
    () => createOutputSettingsPreference(findService()),
    dependsOn: [SharedPreferencesAdapter],
  );

  findService.registerSingletonWithDependencies(
    () => OpenAiRepository(findService()),
    dependsOn: [OpenAiSettingsPreference],
  );

  await findService.allReady();
}
