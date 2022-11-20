part of '../../navigation_hub.dart';
 

abstract class INavigationHubDataSource {
  Future<NumberTrivia> getNumberTrivia(NumberTrivia model);
}

class NavigationHubDataSource implements INavigationHubDataSource {
  final Dio _httpClient;

  const NavigationHubDataSource(this._httpClient);

  @override
   Future<NumberTrivia> getNumberTrivia(NumberTrivia model) => _httpClient
      .post('', data: model.toMap())
      .then((json) => compute(parseNumberModel, json).then((value) => value));
} 