import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:l10n/l10n.dart';
import 'package:learn/core/extensions/with_context.dart';
import 'package:learn/core/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'features/authorization/authorization.dart';
import 'features/environment_selector/environment_selector.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

const bool isEnvironmentSelectorEnabled = true;

class App extends StatefulWidget {
  const App();
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => StringProvider()),
        BlocProvider(create: (context) => EnvironmentSelectorCubit(context: context)),
      ],
      child: Sizer(
        builder: (_, __, ___) {
          return Consumer<ThemeProvider>(
            builder: (context, themeProvider, __) => MaterialApp(
              color: context.colors.baseSecondary,
              useInheritedMediaQuery: true,
              debugShowCheckedModeBanner: false,
              onGenerateRoute: (_) => AuthorizationScreen.route(),
              builder: (_, child) {
                return EnvironmentSelectorScreen(
                  child: child ?? const SizedBox(),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class AppView extends StatefulWidget {
  final Widget child;

  const AppView({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => AppViewState();
}

class AppViewState extends State<AppView> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          widget.child,
        ],
      ),
    );
  }
}
