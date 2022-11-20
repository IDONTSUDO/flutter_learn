import 'dart:ui';

import 'package:learn/core/theme/theme_provider.dart';

import 'text_colors.dart';

enum FontColor {
  text,
  dark,
  light,
  error,
  active,
  primary,
  secondary,
  tertiary,
  quarternary,
}

extension FontColorX on FontColor {
  TextColors get _textColors => TextColors(ThemeProvider.palette);

  Color get color {
    switch (this) {
      case FontColor.primary:
        return _textColors.primary;
      case FontColor.secondary:
        return _textColors.secondary;
      case FontColor.tertiary:
        return _textColors.tertiary;
      case FontColor.quarternary:
        return _textColors.quarternary;
      case FontColor.active:
        return _textColors.accent;
      case FontColor.error:
        return _textColors.error;
      case FontColor.text:
        return _textColors.text;
      case FontColor.light:
        return _textColors.light;
      case FontColor.dark:
        return _textColors.dark;
    }
  }
}
