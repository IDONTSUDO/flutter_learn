part of '../../{{name.snakeCase()}}.dart';

abstract class I{{name.pascalCase()}}Repository {
  Future<NumberTrivia> getNumberTrivia(NumberTrivia model);
}

class {{name.pascalCase()}}Repository implements I{{name.pascalCase()}}Repository {
  final I{{name.pascalCase()}}DataSource _featureApi;

  const {{name.pascalCase()}}Repository(
   this._featureApi,
  );

  @override
  Future<NumberTrivia> getNumberTrivia(NumberTrivia model) => _featureApi.getNumberTrivia(model);
}