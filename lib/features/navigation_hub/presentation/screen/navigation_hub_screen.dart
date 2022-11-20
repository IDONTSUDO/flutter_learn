part of '../../navigation_hub.dart';

class NavigationHubScreen extends StatefulWidget {
  static const routeName = RouteName.navigationHub;

  const NavigationHubScreen();
  static Route route() {
    return ScreenTransitions.getTransition(
      ScreenTransitionType.fadeIn,
      RouteSettings(name: routeName.name),
      const NavigationHubScreen(),
    );
  }

  @override
  State<NavigationHubScreen> createState() => _NavigationHubScreenState();
}

class _NavigationHubScreenState
    extends InjectableState<NavigationHubScreen, NavigationHubCubit, NavigationHubState> {
  @override
  Widget builder(BuildContext context, NavigationHubState state) {
    return Container();
  }
}
