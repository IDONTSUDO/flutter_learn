part of '../locator.dart';

void _setupUseCases() {
  locator.registerFactory(() => UserIsAuthorizedUseCase(locator()));
}
