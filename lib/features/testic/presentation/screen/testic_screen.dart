part of '../../testic.dart';

class TesticScreen extends StatefulWidget {
  const TesticScreen();

  @override
  State<TesticScreen> createState() => _TesticScreenState();
}

class _TesticScreenState extends InjectableState<TesticScreen, TesticCubit, TesticState> {
  @override
  Widget builder(BuildContext context, TesticState state) {
    return Container(
      child: Text('TOOD', style: context.textStyles.body1()),
    );
  }
}
