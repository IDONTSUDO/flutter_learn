part of '../../{{name.snakeCase()}}.dart';
 

abstract class I{{name.pascalCase()}}DataSource {
  Future<NumberTrivia> getNumberTrivia(NumberTrivia model);
}

class {{name.pascalCase()}}DataSource implements I{{name.pascalCase()}}DataSource {
  final Dio _httpClient;

  const {{name.pascalCase()}}DataSource(this._httpClient);

  @override
   Future<NumberTrivia> getNumberTrivia(NumberTrivia model) => _httpClient
      .post('', data: model.toMap())
      .then((json) => compute(parseNumberModel, json).then((value) => value));
} 