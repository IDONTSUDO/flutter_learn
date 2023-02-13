part of '../../authorization.dart';

abstract class IAuthorizationRepository {
  Future<UserModel> getNumberTrivia(UserModel model);
}

class AuthorizationRepository implements IAuthorizationRepository {
  final IAuthorizationDataSource _featureApi;

  const AuthorizationRepository(
    this._featureApi,
  );

  @override
  Future<UserModel> getNumberTrivia(UserModel model) => _featureApi.getNumberTrivia(model);
}
