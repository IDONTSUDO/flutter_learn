import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_KEY_TOKEN = 'prefs_key_token';
const String PREFS_KEY_SPOTIFY_TOKEN = 'prefs_key_spotify_token';
const String PREFS_KEY_PROFILE = 'prefs_key_profile';
const String PREFS_KEY_COMPANION = 'prefs_key_companion';
const String PREFS_KEY_IS_ONBOARD_SUCCESS = 'prefs_key_is_onboard_success';
const String PREFS_KEY_CURRENT_ENVIRONMENT = 'prefs_key_current_environment';
const String PREFS_KEY_DOCS = 'prefs_key_docs';
const String PREFS_KEY_DOCS_ACCEPTED = 'prefs_key_accept_docs';
const String PREFS_KEY_FIRST_LAUNCH = 'prefs_key_first_launch';
const String PREFS_KEY_UNITY_THEME = 'prefs_key_unity_theme';
const String PREFS_KEY_LAST_DAY_CHALLENGE = 'prefs_key_last_day_challenge';
const String PREFS_KEY_LAST_DAY_EVERY_DAY_REWARDS = 'prefs_key_last_day_every_day_rewards';
const String PREFS_KEY_PHOTO_AVATAR = 'prefs_key_photo_avatar';

mixin Cleanable {
  Future<void> clean();
}

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
