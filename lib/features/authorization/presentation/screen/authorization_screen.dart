part of '../../authorization.dart';

class AuthorizationScreen extends StatefulWidget {
  static const routeName = RouteName.authorization;

  const AuthorizationScreen();

  static Route route() {
    return ScreenTransitions.getTransition(
      ScreenTransitionType.fadeIn,
      RouteSettings(name: routeName.name),
      const AuthorizationScreen(),
    );
  }

  @override
  State<AuthorizationScreen> createState() => _AuthorizationScreenState();
}

class _AuthorizationScreenState
    extends InjectableState<AuthorizationScreen, AuthorizationCubit, AuthorizationState> {
  @override
  Widget builder(BuildContext context, AuthorizationState state) {
    return Scaffold(
      backgroundColor: context.colors.baseTertiary,
      body: Column(
        children: [
          EmptyInput(
            hintText: 'Login',
            textEditingController: cubit.formControllers['login']!,
          ),
          EmptyInput(
            hintText: 'Password',
            textEditingController: cubit.formControllers['password']!,
          ),
          DefaultButton(
            onPressed: () {
              cubit.onTapLogin();
            },
            child: const Text('login'),
          ),
        ],
      ),
    );
  }
}
