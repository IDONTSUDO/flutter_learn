import 'dart:ui';

import 'package:learn/core/theme/src/app_color.dart';
import 'package:learn/core/theme/src/font_color.dart';
import 'package:learn/core/theme/src/palettes/palettes.dart';

abstract class ColorPalette {
  Palette get type;

  Color pickPaletteColor(AppColor color);

  Color pickFontColor(FontColor color);
}
