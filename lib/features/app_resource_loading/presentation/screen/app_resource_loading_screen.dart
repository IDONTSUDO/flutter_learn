part of '../../app_resource_loading.dart';

class AppResourceLoadingScreen extends StatefulWidget {
  static const routeName = RouteName.resourceLoadingScreen;

  final bool isLoadingProgressShown;

  const AppResourceLoadingScreen({
    this.isLoadingProgressShown = true,
  });

  @override
  State<AppResourceLoadingScreen> createState() => _AppResourceLoadingScreenState();
}

class _AppResourceLoadingScreenState extends State<AppResourceLoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppResourceLoadingCubit, AppResourceLoadingState>(
      bloc: locator.get<AppResourceLoadingCubit>(),
      builder: (context, state) {
        return Scaffold(
          backgroundColor: context.colors.baseSecondary,
        );
      },
    );
  }
}
