import 'package:flutter/material.dart';
import 'package:learn/core/extensions/with_context.dart';
import 'package:sizer/sizer.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ExamplePage(),
    );
  }
}

class ExamplePage extends StatefulWidget {
  const ExamplePage({
    super.key,
  });

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Sizer(
        builder: (BuildContext context, Orientation orientation, DeviceType deviceType) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  color: Colors.red,
                  width: 256.fw,
                  child: Text(
                    256.fw.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
