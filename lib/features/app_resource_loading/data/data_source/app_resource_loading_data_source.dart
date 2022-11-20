part of '../../app_resource_loading.dart';

abstract class IAppResourceLoadingDataSource {
  Future<bool> isAuthorized();
}

class AppResourceLoadingDataSource implements IAppResourceLoadingDataSource {
  final SharedPreferencesService _sharedPreferencesService;
  const AppResourceLoadingDataSource(
    this._sharedPreferencesService,
  );

  @override
  Future<bool> isAuthorized() async {
    final token = await _sharedPreferencesService.getString(PREFS_KEY_TOKEN);
    if (token is String) {
      return true;
    }
    return false;
  }
}
