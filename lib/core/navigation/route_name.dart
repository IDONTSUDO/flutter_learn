import 'package:flutter/foundation.dart';
import 'package:recase/recase.dart';

enum RouteName {
  authorization,
  resourceLoadingScreen,
  navigationHub,
}

extension RouteNameX on RouteName {
  String get name => describeEnum(this).snakeCase;
}
