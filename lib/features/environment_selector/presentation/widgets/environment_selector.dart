part of '../../environment_selector.dart';

class EnvironmentSelectorWidget extends StatelessWidget {
  final Function(Environment)? onSelected;

  const EnvironmentSelectorWidget({
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EnvironmentSelectorCubit, EnvironmentSelectorState>(
      builder: (context, state) {
        final List<Environment> environments = [
          const ProdEnvironment(),
          const DevEnvironment(),
          const CustomEnvironment(),
        ];
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 64.fw),
            child: ScrollConfiguration(
              behavior: NoGlowScrollBehavior(),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: environments.length,
                separatorBuilder: (context, index) => SizedBox(height: 8.fh),
                itemBuilder: (context, index) {
                  final env = environments[index];
                  return DefaultButton.texted(
                    onPressed: () => onSelected?.call(env),
                    text: env.toString().toUpperCase(),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
