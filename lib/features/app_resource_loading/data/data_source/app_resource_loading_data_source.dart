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
    // final token = await _sharedPreferencesService.set(PREFS_KEY_TOKEN);

    return false;
  }
}
