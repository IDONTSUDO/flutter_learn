import 'dart:ui';

import 'package:learn/core/theme/src/app_color.dart';
import 'package:learn/core/theme/src/font_color.dart';

import 'palettes.dart';

class LightPalette extends ColorPalette {
  @override
  Palette get type => Palette.light;

  @override
  Color pickPaletteColor(AppColor color) {
    switch (color) {
      case AppColor.error:
        return const Color(0xFFFF3B30); // FF3B30
      case AppColor.warning:
        return const Color(0xFFFF9500); // FF9500
      case AppColor.success:
        return const Color(0xFF34C759); // 34C759
      case AppColor.tooltip:
      case AppColor.accent:
        return const Color(0xFF35C7F0); // 35C7F0
      case AppColor.accentSecondary:
        return const Color(0xFF007AFF); // 007AFF
      case AppColor.light:
      case AppColor.basePrimary:
      case AppColor.elevatedSecondary:
      case AppColor.baseTertiary:
        return const Color(0xFFFFFFFF); // FFFFFF
      case AppColor.system6:
      case AppColor.elevatedPrimary:
      case AppColor.baseSecondary:
      case AppColor.elevatedTertiary:
        return const Color(0xFFF0F0F8); // F0F0F8
      case AppColor.system1:
        return const Color(0xFF8E8E94); // 8E8E94
      case AppColor.system2:
        return const Color(0xFFACACB3); // ACACB3
      case AppColor.system3:
        return const Color(0xFFC5C5CD); // C5C5CD
      case AppColor.system4:
        return const Color(0xFFCFCFD7); // CFCFD7
      case AppColor.system5:
        return const Color(0xFFE3E3EB); // E3E3EB
      case AppColor.icon:
      case AppColor.dark:
        return const Color(0xFF000000); // 000000
      case AppColor.separatorColor:
        return const Color(0xFF3C3C43).withOpacity(0.36); // 3C3C43
    }
  }

  @override
  Color pickFontColor(FontColor color) {
    switch (color) {
      case FontColor.error:
        return const Color(0xFFFF3B30); // FF3B30
      case FontColor.active:
        return const Color(0xFF35C7F0); // 35C7F0
      case FontColor.text:
        return const Color(0xFF000000); // 000000
      case FontColor.light:
        return const Color(0xFFFFFFFF); // FFFFFF
      case FontColor.primary:
        return const Color(0xFF000000); // 000000
      case FontColor.secondary:
        return const Color(0xFF3C3C43).withOpacity(.7); // 3C3C43B2
      case FontColor.tertiary:
        return const Color(0xFF3C3C43).withOpacity(.35); // 3C3C4359
      case FontColor.quarternary:
        return const Color(0xFF3C3C43).withOpacity(.18); // 3C3C432E
      case FontColor.dark:
        return const Color(0xFF000000); // 000000
    }
  }
}
