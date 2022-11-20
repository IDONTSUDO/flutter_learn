part of '../locator.dart';

void _setupRepositories() {
  locator.registerFactory<IAppResourceLoadingRepository>(
    () => AppResourceLoadingRepository(
      locator(),
    ),
  );
}
