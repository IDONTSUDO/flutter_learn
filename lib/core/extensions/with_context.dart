import 'package:flutter/cupertino.dart';
import 'package:learn/core/theme/theme.dart';

import '../theme/src/typography/typography.dart';

export './figma_sizer.dart';

extension WithContext on BuildContext {
  AppColors get colors => ThemeProvider.colors;

  Typography get textStyles => ThemeProvider.typography;

  ColorPalette get palette => ThemeProvider.palette;

  bool get isDarkMode => ThemeProvider.palette is DarkPalette;
}
