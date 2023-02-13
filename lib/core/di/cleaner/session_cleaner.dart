import 'cleanable.dart';

class SessionCleaner with Cleanable {
  final List<Cleanable> cleanables;

  SessionCleaner(this.cleanables);

  @override
  Future<void> clean() async {
    for (final cleanable in cleanables) {
      await cleanable.clean();
    }
  }
}
