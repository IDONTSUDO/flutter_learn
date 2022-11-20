part of '../../{{name.snakeCase()}}.dart';


class GetNumberTriviaUseCase {
  final I{{name.pascalCase()}}Repository _{{name.camelCase()}}Repository;

  const GetNumberTriviaUseCase(this._{{name.camelCase()}}Repository);

  Future<Result<NumberTrivia, Exception>> call(NumberTrivia model) async {
    try {
      return Success(await _{{name.camelCase()}}Repository.getNumberTrivia(model));
    } on Exception catch (error, stackTrace) {
      return Error(error, stackTrace);
    }
  }
}
