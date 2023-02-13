part of '../../navigation_hub.dart';


class GetNumberTriviaUseCase {
  final INavigationHubRepository _navigationHubRepository;

  const GetNumberTriviaUseCase(this._navigationHubRepository);

  Future<Result<NumberTrivia, Exception>> call(NumberTrivia model) async {
    try {
      return Success(await _navigationHubRepository.getNumberTrivia(model));
    } on Exception catch (error, stackTrace) {
      return Error(error, stackTrace);
    }
  }
}
