part of '../../environment_selector.dart';

abstract class EnvironmentSelectorState extends Equatable {
  const EnvironmentSelectorState();

  @override
  List<Object?> get props => [];
}

class InitInProgress extends EnvironmentSelectorState {
  const InitInProgress();
}

class ShowEnvSelector extends EnvironmentSelectorState {
  const ShowEnvSelector();
}

class InitInitialize extends EnvironmentSelectorState {
  const InitInitialize();
}

class ShowCustomEnvInput extends EnvironmentSelectorState {
  final bool? isValidated;
  String get error => 'URL is not valid';

  const ShowCustomEnvInput({this.isValidated});

  const ShowCustomEnvInput.validated() : this(isValidated: true);

  const ShowCustomEnvInput.notValidated() : this(isValidated: false);

  @override
  List<Object?> get props => [isValidated];
}
