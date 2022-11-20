part of '../../authorization.dart';

class AuthorizationUserUseCase {
  final IAuthorizationRepository _authorizationRepository;

  const AuthorizationUserUseCase(this._authorizationRepository);

  Future<Result<UserModel, Exception>> call(UserModel model) async {
    try {
      return Success(await _authorizationRepository.getNumberTrivia(model));
    } on Exception catch (error, stackTrace) {
      return Error(error, stackTrace);
    }
  }
}
