import 'dart:math';

import 'package:learn/core/theme/theme.dart';
import 'package:sizer/sizer.dart';

const _maxDesignScale = 2.0;
const _minDesignScale = 0.6;

extension FigmaSizer on num {
  double get fh =>
      max(
        _minDesignScale,
        min(_maxDesignScale, 100.h / ThemeProvider.figmaHeight),
      ) *
      this;

  double get fw =>
      max(
        _minDesignScale,
        min(_maxDesignScale, 100.w / ThemeProvider.figmaWidth),
      ) *
      this;
}
