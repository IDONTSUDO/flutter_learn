part of '../../../authorization.dart';

class AuthorizationCubit extends Cubit<AuthorizationState> {
  final formControllers = {
    'login': TextEditingController(),
    'password': TextEditingController(),
  };
  AuthorizationCubit() : super(const AuthorizationState.empty());

  void onTapLogin() {}
}
