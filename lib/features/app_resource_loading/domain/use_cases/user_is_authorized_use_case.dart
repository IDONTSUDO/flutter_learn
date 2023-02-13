part of '../../app_resource_loading.dart';

class UserIsAuthorizedUseCase {
  final IAppResourceLoadingRepository _appResourceLoadingRepository;

  const UserIsAuthorizedUseCase(this._appResourceLoadingRepository);

  Future<Result<bool, Exception>> call() async {
    try {
      return Success(await _appResourceLoadingRepository.isAuthorized());
    } on Exception catch (error, stackTrace) {
      return Error(error, stackTrace);
    }
  }
}
