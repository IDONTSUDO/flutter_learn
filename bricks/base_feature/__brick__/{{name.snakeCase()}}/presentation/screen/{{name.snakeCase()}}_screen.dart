part of '../../{{name.snakeCase()}}.dart';


class {{name.pascalCase()}}Screen extends StatefulWidget {
  const {{name.pascalCase()}}Screen();

  @override
  State<{{name.pascalCase()}}Screen> createState() => _{{name.pascalCase()}}ScreenState();
}

class _{{name.pascalCase()}}ScreenState extends InjectableState<{{name.pascalCase()}}Screen, {{name.pascalCase()}}Cubit, {{name.pascalCase()}}State> {
  @override
  Widget builder(BuildContext context, {{name.pascalCase()}}State state) {
    return Container();
  }
}
