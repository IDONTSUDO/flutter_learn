import 'package:learn/core/core.dart';

enum FontName {
  largeTitle,
  title1,
  title2,
  title3,
  title4,
  headline,
  body1,
  body2,
  footnote,
  caption1,
  caption2,
  caption3,
  headerLarge,
  headerSmall,
  labelLarge,
  labelSmall,
}

extension FontSizeX on FontName {
  double get size {
    switch (this) {
      case FontName.largeTitle:
        return 58.0.fh;
      case FontName.title1:
        return 28.0.fh;
      case FontName.title2:
        return 24.0.fh;
      case FontName.title3:
        return 22.0.fh;
      case FontName.title4:
        return 20.0.fh;
      case FontName.headline:
        return 18.0.fh;
      case FontName.body1:
        return 16.0.fh;
      case FontName.body2:
        return 15.0.fh;
      case FontName.footnote:
        return 14.0.fh;
      case FontName.caption1:
        return 12.0.fh;
      case FontName.caption2:
        return 10.0.fh;
      case FontName.caption3:
        return 8.0.fh;
      case FontName.headerLarge:
        return 40.0.fh;
      case FontName.headerSmall:
        return 24.0.fh;
      case FontName.labelLarge:
        return 18.0.fh;
      case FontName.labelSmall:
        return 14.0.fh;
    }
  }
}
