import 'package:flutter/material.dart';
import 'package:learn/core/core.dart';
import 'package:learn/ui/icons/svg_icon.dart';
import 'package:learn/ui/ui.dart';

enum SensoBackButtonType {
  arrow,
  chevrone,
}

class SensoBackButton extends StatelessWidget {
  static const double defaultSize = 40;

  final SensoBackButtonType type;
  final bool isEnabled;
  final Function onTap;
  final double disabledOpacity;
  final Color? iconColor;
  final double _size;
  final bool _withCircleBackground;
  final bool needShadow;

  SensoBackButton.withBackground({
    required this.onTap,
    this.needShadow = true,
    this.isEnabled = true,
    this.type = SensoBackButtonType.arrow,
    this.disabledOpacity = 0.0,
  })  : iconColor = null,
        _size = defaultSize.fh,
        _withCircleBackground = true;

  SensoBackButton({
    required this.onTap,
    this.isEnabled = true,
    this.needShadow = true,
    this.type = SensoBackButtonType.arrow,
    this.disabledOpacity = 0.0,
    this.iconColor,
  })  : _size = defaultSize.fh,
        _withCircleBackground = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: AnimationType.base.duration,
      opacity: isEnabled ? 1 : disabledOpacity,
      child: IgnorePointer(
        ignoring: !isEnabled,
        child: _buildWidget(context),
      ),
    );
  }

  Widget _buildWidget(BuildContext context) {
    if (_withCircleBackground) {
      return _buildCircleButton(context);
    }
    return _buildIconButton(context);
  }

  Widget _buildCircleButton(BuildContext context) {
    return SizedBox(
      width: _size,
      height: _size,
      child: CircleElevatedButton(
        elevation: needShadow ? 4 : 0,
        isEnabled: isEnabled,
        onTap: onTap,
        icon: _buildIcon(context),
      ),
    );
  }

  Widget _buildIconButton(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap.call(),
      behavior: HitTestBehavior.translucent,
      child: SizedBox(
        width: _size / 2,
        height: _size / 2,
        child: Center(
          child: _buildIcon(context),
        ),
      ),
    );
  }

  SvgIcon _buildIcon(BuildContext context) {
    switch (type) {
      case SensoBackButtonType.arrow:
        return SvgIcon(svgName: '');
      case SensoBackButtonType.chevrone:
        return SvgIcon(
          svgName: '',
          size: _size / 2,
          color: iconColor,
        );
    }
  }
}
