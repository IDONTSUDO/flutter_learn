part of '../../testic.dart';

abstract class ITesticRepository {
  Future<NumberTrivia> getNumberTrivia(NumberTrivia model);
}

class TesticRepository implements ITesticRepository {
  final ITesticDataSource _featureApi;

  const TesticRepository(
   this._featureApi,
  );

  @override
  Future<NumberTrivia> getNumberTrivia(NumberTrivia model) => _featureApi.getNumberTrivia(model);
}