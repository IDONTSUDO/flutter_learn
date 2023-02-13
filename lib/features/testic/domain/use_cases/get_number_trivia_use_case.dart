part of '../../testic.dart';


class GetNumberTriviaUseCase {
  final ITesticRepository _testicRepository;

  const GetNumberTriviaUseCase(this._testicRepository);

  Future<Result<NumberTrivia, Exception>> call(NumberTrivia model) async {
    try {
      return Success(await _testicRepository.getNumberTrivia(model));
    } on Exception catch (error, stackTrace) {
      return Error(error, stackTrace);
    }
  }
}
