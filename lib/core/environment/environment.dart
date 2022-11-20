export 'environment_custom.dart';
export 'environment_dev.dart';
export 'environment_prod.dart';

abstract class Environment {
  const Environment();

  String get httpUrl;
}
