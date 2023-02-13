import 'package:flutter/material.dart';

import 'animations.dart';

class AnimatedParabolaTransitionWidget extends StatefulWidget {
  final Widget child;
  final double spreadRadius;

  const AnimatedParabolaTransitionWidget({
    required this.child,
    this.spreadRadius = 80,
  });

  @override
  State<AnimatedParabolaTransitionWidget> createState() => _AnimatedParabolaTransitionWidgetState();
}

class _AnimatedParabolaTransitionWidgetState extends State<AnimatedParabolaTransitionWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: AnimationType.slowest.duration,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final spreadRadius = widget.spreadRadius;
        final dx = spreadRadius * 2 * _controller.value - spreadRadius;
        final dy = -dx * dx / 150;

        return Transform.translate(
          offset: Offset(dx, dy),
          child: widget.child,
        );
      },
    );
  }
}
