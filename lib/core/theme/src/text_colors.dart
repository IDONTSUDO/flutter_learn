import 'dart:ui';

import 'package:learn/core/theme/src/font_color.dart';

import 'app_color.dart';
import 'palettes/palettes.dart';

class TextColors {
  final ColorPalette palette;

  TextColors(this.palette);

  Color get error => palette.pickPaletteColor(AppColor.error);
  Color get accent => palette.pickPaletteColor(AppColor.accent);
  Color get text => palette.pickPaletteColor(AppColor.dark);
  Color get light => palette.pickPaletteColor(AppColor.light);
  Color get dark => palette.pickPaletteColor(AppColor.dark);

  Color get primary => palette.pickFontColor(FontColor.primary);
  Color get secondary => palette.pickFontColor(FontColor.secondary);
  Color get tertiary => palette.pickFontColor(FontColor.tertiary);
  Color get quarternary => palette.pickFontColor(FontColor.quarternary);
}
