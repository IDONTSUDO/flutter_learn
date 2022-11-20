part of '../locator.dart';

void _setupBlocs() {
  locator.registerSingleton(() => AppResourceLoadingCubit(
        locator(),
        locator(),
      ));
  locator.registerFactory(() => AuthorizationCubit());
}
