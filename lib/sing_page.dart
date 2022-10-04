import 'package:flutter/material.dart';
import 'package:learn/todo_page.dart';
import 'package:sizer/sizer.dart';

import 'package:learn/core/extensions/with_context.dart';

class SignPage extends StatefulWidget {
  const SignPage({
    super.key,
  });

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  @override
  Widget build(BuildContext context) {
    const textstl = TextStyle(color: Colors.white, fontSize: 20);

    const logindec = InputDecoration(
      fillColor: Color(0xFFDA4444),
      filled: true,
      labelText: 'Sign in',
      labelStyle: textstl,
    );

    const passdec = InputDecoration(
      fillColor: Color(0xFFDA4444),
      filled: true,
      labelText: 'Password',
      labelStyle: textstl,
    );

    return Scaffold(
      backgroundColor: const Color(0xFFD9D9D9),
      body: Sizer(
        builder: (BuildContext context, Orientation orientation,
            DeviceType deviceType) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      "LEARN APP",
                      style:
                          TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                    )),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  width: 350.fw,
                  height: 50.fh,
                  child: const TextField(
                    decoration: logindec,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  width: 350.fw,
                  height: 50.fh,
                  child: const TextField(
                    obscureText: true,
                    decoration: passdec,
                  ),
                ),
                Container(
                  width: 200.fw,
                  height: 80.fh,
                  padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
                  child: TextButton(
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Color(0xFFDA4444)),
                      foregroundColor:
                          MaterialStatePropertyAll<Color>(Color(0xFFFFFFFF)),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TodoPage()),
                      );
                    },
                    child: const Text(
                      'sing in',
                      style: textstl,
                    ),
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
