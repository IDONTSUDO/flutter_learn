import 'package:flutter/material.dart';
import 'package:learn/todo_page.dart';

import 'package:learn/core/extensions/with_context.dart';

class SignPage extends StatelessWidget {
  const SignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.all(40.fw),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'LEARN APP',
            ),
            SizedBox(height: 15.fh),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Sign in',
              ),
            ),
            SizedBox(height: 15.fh),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
            ),
            SizedBox(height: 45.fh),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TodoPage(),
                  ),
                );
              },
              child: const Text(
                'sing in',
                // style: textstl,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
