import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesProvider {
  final Future<SharedPreferences> _futurePrefs;

  SharedPreferencesProvider(
    this._futurePrefs,
  );

  final StreamController<String> _keys$ = StreamController.broadcast();

  Stream<T> onChange$<T>(String key, T defaultValue) async* {
    final prefs = await _futurePrefs;
    yield* _keys$.stream.where((s) => key == s).map((key) => _getSync(key, defaultValue, prefs));
  }

  Future<void> remove(String key) => _futurePrefs.then((prefs) {
        return prefs.remove(key).then((_) => _keys$.add(key));
      });

  Future<T> get<T>(String key, T defaultValue) => _futurePrefs.then((prefs) {
        final value = _getSync(key, defaultValue, prefs);
        return value;
      });

  T _getSync<T>(String key, T defaultValue, SharedPreferences prefs) {
    if (defaultValue is String) {
      return (prefs.getString(key) ?? defaultValue) as T;
    } else if (defaultValue is int) {
      return (prefs.getInt(key) ?? defaultValue) as T;
    } else if (defaultValue is bool) {
      return (prefs.getBool(key) ?? defaultValue) as T;
    } else {
      throw "This type: ${defaultValue.runtimeType} isn't supported";
    }
  }

  Future save<T>(String key, T value) => _futurePrefs.then((prefs) {
        if (value is int) {
          return prefs.setInt(key, value).then((_) => _keys$.add(key));
        } else if (value is String) {
          return prefs.setString(key, value).then((_) => _keys$.add(key));
        } else if (value is bool) {
          return prefs.setBool(key, value).then((_) => _keys$.add(key));
        } else {
          throw "This type: ${value.runtimeType} isn't supported";
        }
      });

  Future<void> clear() => _futurePrefs.then((value) => value.clear());

  Future<void> logEntries() async {
    final instance = await _futurePrefs;
    instance.getKeys().forEach((key) => print(
          'SharedPreferencesService.log: '
          '$key : ${instance.get(key)}',
        ));
  }
}
