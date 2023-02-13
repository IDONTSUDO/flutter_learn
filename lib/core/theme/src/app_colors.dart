import 'package:flutter/material.dart';

import 'app_color.dart';
import 'palettes/palettes.dart';

@immutable
class ColorRole extends Color {
  final Color primary;
  final Color secondary;
  final Color tertiary;
  final Color? quarternary;

  const ColorRole.x3({
    required this.primary,
    required this.secondary,
    required this.tertiary,
  })  : quarternary = null,
        super(0);

  const ColorRole.x4({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.quarternary,
  }) : super(0);
}

class AppColors {
  final ColorPalette palette;

  AppColors(this.palette);

  Color get error => palette.pickPaletteColor(AppColor.error);
  Color get warning => palette.pickPaletteColor(AppColor.warning);
  Color get success => palette.pickPaletteColor(AppColor.success);

  Color get accent => palette.pickPaletteColor(AppColor.accent);
  Color get secondaryAccent => palette.pickPaletteColor(AppColor.accentSecondary);

  Color get icon => palette.pickPaletteColor(AppColor.icon);
  Color get disabled => palette.pickPaletteColor(AppColor.system4);

  Color get tooltip => palette.pickPaletteColor(AppColor.tooltip);

  Color get basePrimary => palette.pickPaletteColor(AppColor.basePrimary);
  Color get baseSecondary => palette.pickPaletteColor(AppColor.baseSecondary);
  Color get baseTertiary => palette.pickPaletteColor(AppColor.baseTertiary);

  Color get elevatedPrimary => palette.pickPaletteColor(AppColor.elevatedPrimary);
  Color get elevatedSecondary => palette.pickPaletteColor(AppColor.elevatedSecondary);
  Color get elevatedTertiary => palette.pickPaletteColor(AppColor.elevatedTertiary);

  Color get dark => palette.pickPaletteColor(AppColor.dark);
  Color get light => palette.pickPaletteColor(AppColor.light);

  Color get separatorColor => palette.pickPaletteColor(AppColor.separatorColor);
}
