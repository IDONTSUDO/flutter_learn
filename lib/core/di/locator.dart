import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:l10n/l10n.dart';
import 'package:learn/core/di/di.dart';
import 'package:learn/core/environment/environment.dart';
import 'package:learn/core/theme/theme_provider.dart';
import 'package:learn/features/app_resource_loading/app_resource_loading.dart';
import 'package:learn/features/authorization/authorization.dart';
import 'package:learn/features/testic/testic.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'bloc/bloc.dart';
part 'repository/repository.dart';
part 'usecase/usecase.dart';
part 'scenarios/scenarios.dart';

final GetIt locator = GetIt.instance;

Future<bool> setupLocator({
  required BuildContext context,
  required Environment environment,
}) async {
  await locator.reset();

  locator.registerSingleton(environment);

  _setupContextualDependencies(context);

  _setupRepositories();
  _setupUseCases();
  _setupScenarios();
  _setupBlocs();
  _setupStorages();
  return true;
}

void _setupContextualDependencies(BuildContext context) {
  locator
    ..registerLazySingleton(() => ThemeProvider())
    ..registerLazySingleton(() => StringProvider());
}

void _setupStorages() {
  locator.registerSingletonAsync(() => SharedPreferences.getInstance());
  locator.registerFactory(() => SharedPreferencesService());
  locator.registerLazySingleton(
    () => SharedPreferencesProvider(
      locator.getAsync(),
    ),
  );
}
