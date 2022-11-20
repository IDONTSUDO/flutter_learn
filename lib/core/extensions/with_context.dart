import 'package:flutter/widgets.dart';

import 'package:learn/core/theme/theme.dart';

export './figma_sizer.dart';

extension WithContext on BuildContext {
  AppColors get colors => ThemeProvider.colors;

  ColorPalette get palette => ThemeProvider.palette;

  bool get isDarkMode => ThemeProvider.palette is DarkPalette;
}
