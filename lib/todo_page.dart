import 'dart:async';

import 'package:flutter/material.dart';
import 'package:learn/core/extensions/with_context.dart';

typedef ST = List<bool>;

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TodoPageState();
  }
}

class _TodoPageState extends State<TodoPage> {
  final StreamController<ST> controller = StreamController<ST>.broadcast();
  Sink<ST> get inputSt => controller.sink;
  Stream<ST> get outputSt => controller.stream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD9D9D9),
      body: StreamBuilder<ST>(
        stream: outputSt,
        builder: (
          BuildContext context,
          AsyncSnapshot<ST> snapshot,
        ) {
          ST? list = snapshot.hasData ? snapshot.data : [];
          return ListView(
            padding: const EdgeInsets.all(10),
            children: [
              const Text(
                "Todo list streams",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
              ),
              for (int i = 0; i < list!.length; i++)
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                  height: 70.fh,
                  child: OutlinedButton(
                    onPressed: () {
                      list[i] = !list[i];
                      inputSt.add(list);
                    },
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Color(0xFFDA4444)),
                      foregroundColor:
                          MaterialStatePropertyAll<Color>(Color(0xFFFFFFFF)),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFD9D9D9),
                            ),
                            child: list[i]
                                ? const Icon(Icons.add,
                                    color: Color(0xFFDA4444), size: 40)
                                : const Icon(IconData(0), size: 40),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "todo ${i + 1}",
                            textAlign: TextAlign.left,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              IconButton(
                onPressed: () {
                  list.add(false);
                  inputSt.add(list);
                },
                iconSize: 75,
                icon: const Icon(
                  Icons.add,
                  color: Color(0xff991f1f),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
