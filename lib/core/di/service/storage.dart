import 'dart:async';

import 'package:learn/core/di/cleaner/cleaner.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService with Cleanable {
  final StreamController<String> _keys$ = StreamController.broadcast();

  SharedPreferencesService();

  Stream<String> onChange$(String key) async* {
    final instance = await SharedPreferences.getInstance();
    yield* _keys$.stream.where((s) => key == s).map((key) => instance.getString(key) ?? '');
  }

  Future<String?> getString(String key) async {
    final instance = await SharedPreferences.getInstance();
    return instance.getString(key);
  }

  Future setString(String key, String value) async {
    final instance = await SharedPreferences.getInstance();
    return instance.setString(key, value).then((_) => _keys$.add(key));
  }

  Future<bool?> getBool(String key) async {
    final instance = await SharedPreferences.getInstance();
    return instance.getBool(key);
  }

  Future setBool(String key, {required bool value}) async {
    final instance = await SharedPreferences.getInstance();
    return instance.setBool(key, value).then((_) => _keys$.add(key));
  }

  Future<void> remove(String key) async {
    final instance = await SharedPreferences.getInstance();
    return instance.remove(key).then((_) => _keys$.add(key));
  }

  Future clear() async {
    final instance = await SharedPreferences.getInstance();

    print('SharedPreferencesService.clear before: ${instance.getKeys()}');
    return instance.clear().then((_) => print(
          'SharedPreferencesService.clear after: ${instance.getKeys()}',
        ));
  }

  Future<void> logEntries() async {
    final instance = await SharedPreferences.getInstance();
    instance.getKeys().forEach((key) => print(
          'SharedPreferencesService.log: '
          '$key : ${instance.get(key)}',
        ));
  }

  @override
  Future<void> clean() async {
    final instance = await SharedPreferences.getInstance();

    _keys$.close();
    instance.clear();
  }
}
