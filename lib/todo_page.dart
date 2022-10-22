import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn/core/extensions/with_context.dart';

import 'bloc/todocubit.dart';

typedef ST = List<bool>;

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => TodoCubit(),
        child: BlocBuilder<TodoCubit, List<bool>>(
          builder: (context, list) => _TodoPageState(),
        ),
      ),
    );
  }
}

class _TodoPageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<TodoCubit>().state;
    return ListView(
      padding: EdgeInsets.all(15.fw),
      children: [
        const Text(
          "Todo list cubit",
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20.fh),
        for (int i = 0; i < state.length; i++)
          Padding(
            padding: EdgeInsets.only(bottom: 15.fh),
            child: OutlinedButton(
              onPressed: () => context.read<TodoCubit>().toggle(i),
              style: Theme.of(context).textButtonTheme.style?.copyWith(
                    padding: MaterialStatePropertyAll<EdgeInsets>(
                      EdgeInsets.symmetric(
                        vertical: 15.fh,
                        horizontal: 15.fw,
                      ),
                    ),
                  ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('todo ${i + 1}'),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        child: state[i]
                            ? const Icon(Icons.add,
                                color: Color(0xFFDA4444), size: 40)
                            : const Icon(IconData(0), size: 40),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        IconButton(
          onPressed: () => context.read<TodoCubit>().add(),
          iconSize: 75,
          icon: const Icon(
            Icons.add,
            color: Color(0xff991f1f),
          ),
        ),
      ],
    );
  }
}
