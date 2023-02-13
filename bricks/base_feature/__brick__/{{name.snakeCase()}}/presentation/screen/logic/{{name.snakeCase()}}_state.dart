part of '../../../{{name.snakeCase()}}.dart';
 
class {{name.pascalCase()}}State extends Equatable {
  const {{name.pascalCase()}}State();

  const {{name.pascalCase()}}State.empty() : this();

  @override
  List<Object> get props => [];

  {{name.pascalCase()}}State copyWith() {
    return {{name.pascalCase()}}State();
  }
}