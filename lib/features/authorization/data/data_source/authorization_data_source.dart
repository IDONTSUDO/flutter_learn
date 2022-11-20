part of '../../authorization.dart';

abstract class IAuthorizationDataSource {
  Future<UserModel> getNumberTrivia(UserModel model);
}

class AuthorizationDataSource implements IAuthorizationDataSource {
  final Dio _httpClient;

  const AuthorizationDataSource(this._httpClient);

  @override
  Future<UserModel> getNumberTrivia(UserModel model) =>
      _httpClient.post('/auth/login', data: model.toMap()).then(
          (responce) => compute(userModelFromMap, responce.data as String).then((value) => value));
}
