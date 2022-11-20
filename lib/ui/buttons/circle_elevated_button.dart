import 'package:flutter/material.dart';
import 'package:learn/core/core.dart';
import 'package:learn/ui/icons/svg_icon.dart';
import 'package:learn/ui/ui.dart';

class CircleElevatedButton extends StatelessWidget {
  final SvgIcon icon;
  final Color? backgroundColor;
  final EdgeInsets iconOffset;
  final double elevation;
  final bool isEnabled;
  final double disabledOpacity;
  final Function onTap;
  final double size;

  const CircleElevatedButton({
    required this.onTap,
    required this.icon,
    Key? key,
    this.size = 40,
    this.backgroundColor,
    this.iconOffset = const EdgeInsets.all(0),
    this.elevation = 4,
    this.isEnabled = true,
    this.disabledOpacity = 0.33,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isEnabled ? 1 : disabledOpacity,
      duration: AnimationType.base.duration,
      child: SizedBox(
        width: size.fw,
        height: size.fh,
        child: Material(
          elevation: elevation,
          shadowColor: context.colors.dark.withOpacity(.75),
          color: backgroundColor ?? context.colors.basePrimary,
          shape: const CircleBorder(),
          child: InkWell(
            borderRadius: BorderRadius.circular(90),
            onTap: () => isEnabled ? onTap.call() : () {},
            child: Padding(
              padding: iconOffset,
              child: Center(
                child: icon,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
