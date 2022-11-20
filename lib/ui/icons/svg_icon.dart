import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learn/core/core.dart';

class SvgIcon extends StatelessWidget {
  final Color? color;

  final double width;
  final double height;
  final BoxFit boxFit;

  final String svgName;

  SvgIcon copyWith({
    String? svgName,
    Color? color,
    double? width,
    double? height,
    BoxFit? boxFit,
  }) =>
      SvgIcon(
        svgName: svgName ?? this.svgName,
        color: color ?? this.color,
        width: width ?? this.width,
        height: height ?? this.height,
        boxFit: boxFit ?? this.boxFit,
      );

  SvgIcon({
    required this.svgName,
    this.color,
    double? size,
    double? width,
    double? height,
    this.boxFit = BoxFit.contain,
  })  : assert(
          !((width != null || height != null) && size != null),
          'You can only specify size or height/width for icon',
        ),
        height = size?.fh ?? height?.fh ?? 14.0.fh,
        width = size?.fw ?? width?.fw ?? 14.0.fw;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/$svgName.svg',
      fit: boxFit,
      width: width,
      height: height,
      color: color,
      package: 'ui_kit',
    );
  }
}
