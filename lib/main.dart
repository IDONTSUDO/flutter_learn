import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() {
  AppBeginer().start();
}

class AppBeginer {
  bool uiDebugMode = const bool.fromEnvironment('preview');
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
