part of '../../app_resource_loading.dart';

abstract class IAppResourceLoadingRepository {
  Future<bool> isAuthorized();
}

class AppResourceLoadingRepository implements IAppResourceLoadingRepository {
  final IAppResourceLoadingDataSource _featureApi;

  const AppResourceLoadingRepository(
    this._featureApi,
  );

  @override
  Future<bool> isAuthorized() => _featureApi.isAuthorized();
}
