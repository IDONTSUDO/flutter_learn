import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';
import 'core/environment/environment.dart';

const bool isEnvironmentSelectorEnabled = true;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  const env = isEnvironmentSelectorEnabled ? DevEnvironment() : ProdEnvironment();

  AppBeginner(env: env).start();
}

class AppBeginner {
  final Environment env;
  bool uiDebugMode = const bool.fromEnvironment('preview');

  AppBeginner({
    required this.env,
  });

  void start() {
    if (uiDebugMode) {
      return runApp(devicePreviewMode());
    }
    return runApp(dev());
  }

  Widget devicePreviewMode() {
    return DevicePreview(
      enabled: true,
      builder: (context) => const App(),
    );
  }

  Widget dev() {
    return const App();
  }
}
