import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

import 'src/app_colors.dart';
import 'src/typography/typography.dart';
import 'src/palettes/palettes.dart';

class ThemeProvider extends ChangeNotifier {
  static const double figmaHeight = 844.0;
  static const double figmaWidth = 390.0;

  static AppColors get colors => AppColors(palette);

  static Typography get typography => Typography();

  static bool get needNotScrollVertical => 100.h / figmaHeight >= 1;

  ColorPalette _palette = DarkPalette();

  static ColorPalette get palette => _instance._palette;

  factory ThemeProvider() => _instance;
  static final ThemeProvider _instance = ThemeProvider._();

  ThemeProvider._();

  void changePalette(Palette palette) {
    switch (palette) {
      case Palette.light:
        _palette = LightPalette();
        break;
      case Palette.dark:
        _palette = DarkPalette();
        break;
    }
    notifyListeners();
  }
}
