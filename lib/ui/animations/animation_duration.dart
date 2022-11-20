enum AnimationType {
  /// 0
  instant,

  /// 100
  rapid,

  /// 200
  quick,

  /// 300

  base,

  /// 500

  slow,

  /// 1000
  ultraslow,

  /// 2000
  slowest,
}

extension AnimationDuration on AnimationType {
  Duration get duration {
    switch (this) {
      case AnimationType.instant:
        return const Duration();
      case AnimationType.rapid:
        return const Duration(milliseconds: 100);
      case AnimationType.quick:
        return const Duration(milliseconds: 200);
      case AnimationType.base:
        return const Duration(milliseconds: 300);
      case AnimationType.slow:
        return const Duration(milliseconds: 500);
      case AnimationType.ultraslow:
        return const Duration(milliseconds: 1000);
      case AnimationType.slowest:
        return const Duration(milliseconds: 2000);
    }
  }
}
