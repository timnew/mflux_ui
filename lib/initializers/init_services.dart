import 'package:app_preference/app_preference_plugin_interface.dart';
import 'package:app_preference_shared_preferences/app_preference_shared_preferences.dart';
import 'package:mfluxui/features/find_service.dart';
import 'package:mfluxui/features/open_ai.dart';
import 'package:mfluxui/features/output.dart';
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
    dependsOn: [AppPreferenceAdapter],
  );
  findService.registerSingletonWithDependencies(
    () => createGenerationOptionsPreference(findService()),
    dependsOn: [AppPreferenceAdapter],
  );
  findService.registerSingletonWithDependencies(
    () => createOutputSettingsPreference(findService()),
    dependsOn: [AppPreferenceAdapter],
  );

  findService.registerSingletonWithDependencies(
    () => OpenAiRepository(findService()),
    dependsOn: [OpenAiSettingsPreference],
  );
  findService.registerSingletonWithDependencies(
    () => OutputRepository(findService()),
    dependsOn: [OutputSettingsPreference],
  );

  await findService.allReady();
}
