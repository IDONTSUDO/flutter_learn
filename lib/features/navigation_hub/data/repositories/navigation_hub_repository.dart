part of '../../navigation_hub.dart';

abstract class INavigationHubRepository {
  Future<NumberTrivia> getNumberTrivia(NumberTrivia model);
}

class NavigationHubRepository implements INavigationHubRepository {
  final INavigationHubDataSource _featureApi;

  const NavigationHubRepository(
   this._featureApi,
  );

  @override
  Future<NumberTrivia> getNumberTrivia(NumberTrivia model) => _featureApi.getNumberTrivia(model);
}