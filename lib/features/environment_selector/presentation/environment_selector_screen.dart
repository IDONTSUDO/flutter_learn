part of '../environment_selector.dart';

class EnvironmentSelectorScreen extends StatefulWidget {
  final Widget child;

  const EnvironmentSelectorScreen({
    required this.child,
  });

  @override
  State<EnvironmentSelectorScreen> createState() => _EnvironmentSelectorScreenState();
}

class _EnvironmentSelectorScreenState extends InjectableState<EnvironmentSelectorScreen,
    EnvironmentSelectorCubit, EnvironmentSelectorState> {
  _EnvironmentSelectorScreenState() : super.empty();

  @override
  void initState() {
    cubit = context.read<EnvironmentSelectorCubit>();
    super.initState();
  }

  Future<void> _onTapEnvButton(Environment env) async {
    cubit.onTapEnvButton(env);
  }

  void _onCustomEnvInputChanged(String text) {
    cubit.onCustomEnvInputChanged(text);
  }

  void _onCustomEnvInputEditingComplete(String text) {
    cubit.onCustomEnvInputEditingComplete(text);
  }

  @override
  Widget builder(BuildContext context, EnvironmentSelectorState state) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.colors.baseSecondary,
      body: _buildBody(state),
    );
  }

  Widget _buildBody(EnvironmentSelectorState state) {
    if (state is InitInitialize) {
      return AppView(
        key: ValueKey(ThemeProvider.palette.type),
        child: widget.child,
      );
    } else if (state is ShowEnvSelector) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 149.fh),
          const SplashWidget(),
          const Spacer(),
          EnvironmentSelectorWidget(
            onSelected: (env) => _onTapEnvButton(env),
          ),
          SizedBox(height: 64.fh),
        ],
      );
    } else if (state is ShowCustomEnvInput) {
      return Navigator(
        onGenerateRoute: (_) => MaterialPageRoute(
          builder: (context) {
            return Column(
              children: [
                SizedBox(height: 149.fh),
                const SplashWidget(),
                EnvironmentInputWidget(
                  onChanged: _onCustomEnvInputChanged,
                  onEditingComplete: _onCustomEnvInputEditingComplete,
                ),
              ],
            );
          },
        ),
      );
    }
    return const Center(child: CircularProgressIndicator());
  }
}
