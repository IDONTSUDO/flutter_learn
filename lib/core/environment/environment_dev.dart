import 'environment.dart';

class DevEnvironment extends Environment {
  const DevEnvironment();

  @override
  String get httpUrl => 'http://localhost:8000';

  @override
  String toString() => 'Dev';
}
