import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn/core/extensions/with_context.dart';

import 'bloc/todobloc.dart';

typedef ST = List<bool>;

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TodoBloc(),
      child: Scaffold(
        body: _TodoPageState(),
      ),
    );
  }
}

class _TodoPageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = context.select((TodoBloc bloc) => bloc.state.todos).toList();
    return ListView(
      padding: EdgeInsets.all(15.fw),
      children: [
        const Text(
          "Todo list streams",
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20.fh),
        for (int i = 0; i < data.length; i++)
          Padding(
            padding: EdgeInsets.only(bottom: 15.fh),
            child: OutlinedButton(
              onPressed: () {
                data[i] = !data[i];
                context.read<TodoBloc>().add(TodoBlocEvent(data));
              },
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
                        child: data[i]
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
          onPressed: () {
            data.add(false);
            context.read<TodoBloc>().add(TodoBlocEvent(data));
          },
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
