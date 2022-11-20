import 'package:flutter/material.dart';
import 'package:learn/core/theme/src/app_color.dart';
import 'package:learn/core/theme/src/font_color.dart';
import 'package:learn/core/theme/src/palettes/palettes.dart';

class DarkPalette extends ColorPalette {
  @override
  Palette get type => Palette.dark;

  @override
  Color pickPaletteColor(AppColor color) {
    switch (color) {
      case AppColor.error:
        return const Color(0xFFFF453A); // FF453A
      case AppColor.warning:
        return const Color(0xFFFF9F0A); // FF9F0A
      case AppColor.success:
        return const Color(0xFF32D74B); // 32D74B
      case AppColor.tooltip:
      case AppColor.accent:
        return const Color(0xFF35C7F0); // 35C7F0
      case AppColor.accentSecondary:
        return const Color(0xFF0A84FF); // 0A84FF
      case AppColor.dark:
      case AppColor.basePrimary:
        return const Color(0xFF000000); // 000000
      case AppColor.elevatedPrimary:
      case AppColor.baseSecondary:
        return const Color(0xFF1C1F22); // 1C1F22
      case AppColor.baseTertiary:
      case AppColor.system5:
        return const Color(0xFF2C2C30); // 2C2C30
      case AppColor.system1:
        return const Color(0xFF8E8E94); // 8E8E94
      case AppColor.system2:
        return const Color(0xFF636367); // 636367
      case AppColor.system3:
      case AppColor.system4:
        return const Color(0xFF48484B); // 48484B
      case AppColor.system6:
        return const Color(0xFF1C1C22); // 1C1C22
      case AppColor.icon:
      case AppColor.light:
        return const Color(0xFFFFFFFF); // FFFFFF
      case AppColor.elevatedSecondary:
        return const Color(0xFF2C2D30); // 2C2D30
      case AppColor.elevatedTertiary:
        return const Color(0xFF3C3C3F); // 3C3C3F
      case AppColor.separatorColor:
        return const Color(0xFF4A4A4E); // 4A4A4E
    }
  }

  @override
  Color pickFontColor(FontColor color) {
    switch (color) {
      case FontColor.primary:
        return const Color(0xFFFFFFFF); // FFFFFF
      case FontColor.secondary:
        return const Color(0xFFEBEBF5).withOpacity(.7); // EBEBF5B2
      case FontColor.tertiary:
        return const Color(0xFFEBEBF5).withOpacity(.35); // EBEBF559
      case FontColor.quarternary:
        return const Color(0xFFEBEBF5).withOpacity(.18); // EBEBF52E
      case FontColor.text:
        return const Color(0xFF000000); // 000000
      case FontColor.light:
        return const Color(0xFFFFFFFF); // FFFFFF
      case FontColor.error:
        return const Color(0xFFFF453A); // FF453A
      case FontColor.active:
        return const Color(0xFF35C7F0); // 35C7F0
      case FontColor.dark:
        return const Color(0xFF000000); // 000000
    }
  }
}
