part of '../../../app_resource_loading.dart';

class AppResourceLoadingCubit extends Cubit<AppResourceLoadingState> {
  final CustomNavigator _customNavigator;
  final UserIsAuthorizedUseCase _userIsAuthorized;

  AppResourceLoadingCubit(
    this._customNavigator,
    this._userIsAuthorized,
  ) : super(const AppResourceLoadingState.empty()) {
    _init();
  }

  void _init() async {
    _userIsAuthorized.call().then((match) => match.match(
        onSuccess: (isAuthorized) {
          if (isAuthorized) {
            _customNavigator.push(AuthorizationScreen.route());
          } else {
            _customNavigator.push(NavigationHubScreen.route());
          }
        },
        onError: (error) {}));
  }
}
