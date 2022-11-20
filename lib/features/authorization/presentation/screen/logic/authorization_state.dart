part of '../../../authorization.dart';

class AuthorizationState extends Equatable {
  const AuthorizationState();

  const AuthorizationState.empty() : this();

  @override
  List<Object> get props => [];

  AuthorizationState copyWith() {
    return const AuthorizationState();
  }
}
