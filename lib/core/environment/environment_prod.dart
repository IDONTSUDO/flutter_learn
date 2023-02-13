import 'environment.dart';

class ProdEnvironment extends Environment {
  const ProdEnvironment();

  @override
  String get httpUrl => '';

  @override
  String toString() => 'Prod';
}
