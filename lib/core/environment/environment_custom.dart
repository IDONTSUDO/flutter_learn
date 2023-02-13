import 'environment_dev.dart';

class CustomEnvironment extends DevEnvironment {
  final String? url;

  const CustomEnvironment({this.url});

  @override
  String get httpUrl => 'https://$_base';

  @override
  String get wssUrl => 'wss://ws-$_base/ws/stream/';

  String get _base {
    final i1 = url!.indexOf('feat');
    final i2 = url!.indexOf('.com');
    assert(i1 > -1);
    assert(i2 > -1);
    return url!.substring(i1, i2 + 4);
  }

  @override
  String toString() => url != null ? _base : 'Custom';
}
