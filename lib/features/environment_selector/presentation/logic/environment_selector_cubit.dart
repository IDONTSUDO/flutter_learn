part of '../../environment_selector.dart';

class EnvironmentSelectorCubit extends Cubit<EnvironmentSelectorState> {
  final BuildContext _context;

  EnvironmentSelectorCubit({
    required BuildContext context,
  })  : _context = context,
        super(const InitInProgress()) {
    _init();
  }

  void _init() {
    emit(const InitInProgress());
    if (isEnvironmentSelectorEnabled) {
      emit(const ShowEnvSelector());
      return;
    }
    _startEnvSetup(const ProdEnvironment());
  }

  void onTapEnvButton(Environment environment) {
    if (environment is CustomEnvironment) {
      emit(const ShowCustomEnvInput());
      return;
    }
    _startEnvSetup(environment);
  }

  void onCustomEnvInputChanged(String text) {
    final isValid = Uri.tryParse(text)?.hasAbsolutePath ?? false;
    emit(isValid ? const ShowCustomEnvInput.validated() : const ShowCustomEnvInput.notValidated());
  }

  void onCustomEnvInputEditingComplete(String url) {
    final isValid = Uri.tryParse(url)?.hasAbsolutePath ?? false;
    if (isValid) {
      _startEnvSetup(CustomEnvironment(url: url));
      return;
    }
    emit(const ShowEnvSelector());
  }

  Future<void> _startEnvSetup(Environment environment) async {
    emit(const InitInProgress());
    await setupLocator(
      context: _context,
      environment: environment,
    );

    final sp = locator<SharedPreferencesService>();
    final currentEnvStr = await sp.getString(PREFS_KEY_CURRENT_ENVIRONMENT);
    final environmentStr = environment.toString();
    if (environmentStr != currentEnvStr && currentEnvStr != null) {
      await sp.clear();
    }
    await sp.setString(PREFS_KEY_CURRENT_ENVIRONMENT, environmentStr);
    sp.logEntries();
    emit(const InitInitialize());
  }
}
