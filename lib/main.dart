import 'package:flutter/material.dart';
import 'package:mfluxui/app/app.dart';

import 'initializers/init_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initServices();

  runApp(const App());
}
