import 'package:flutter/material.dart';
import 'package:learn/core/extensions/with_context.dart';
import 'package:learn/sing_page.dart';
import 'package:sizer/sizer.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    Color red = const Color(0xFFDA4444);
    Color white = const Color(0xFFFFFFFF);
    Color gray = const Color(0xFFD9D9D9);
    return Sizer(builder:
        (BuildContext context, Orientation orientation, DeviceType deviceType) {
      double fontSizeSmall = 20.fw;
      double fontSizeBig = 45.fw;
      return MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: gray,
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(color: white),
            isDense: true,
            contentPadding: EdgeInsets.symmetric(
              vertical: 15.fh,
              horizontal: 10.fw,
            ),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            border: InputBorder.none,
            fillColor: red,
            filled: true,
          ),
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              shape: const MaterialStatePropertyAll<RoundedRectangleBorder>(
                  RoundedRectangleBorder()),
              padding: MaterialStatePropertyAll<EdgeInsets>(
                EdgeInsets.symmetric(
                  vertical: 15.fh,
                  horizontal: 60.fw,
                ),
              ),
              backgroundColor: MaterialStatePropertyAll<Color>(red),
              foregroundColor: MaterialStatePropertyAll<Color>(white),
            ),
          ),
          textTheme: TextTheme(
            subtitle1: TextStyle(fontSize: fontSizeSmall, color: white),
            bodyText2: TextStyle(
              fontSize: fontSizeBig,
              fontWeight: FontWeight.w600,
            ),
            button: TextStyle(fontSize: fontSizeSmall, color: white),
          ),
        ),
        home: const SignPage(),
      );
    });
  }
}
