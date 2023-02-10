part of '../../testic.dart';
 

abstract class ITesticDataSource {
  Future<NumberTrivia> getNumberTrivia(NumberTrivia model);
}

class TesticDataSource implements ITesticDataSource {
  final Dio _httpClient;

  const TesticDataSource(this._httpClient);

  @override
   Future<NumberTrivia> getNumberTrivia(NumberTrivia model) => _httpClient
      .post('', data: model.toMap())
      .then((json) => compute(parseNumberModel, json).then((value) => value));
} 