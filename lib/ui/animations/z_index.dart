import 'package:flutter/material.dart';

abstract class IndexedInterface {
  int get index;
}

class Indexed extends StatelessWidget implements IndexedInterface {
  @override
  final int index;
  final Widget child;

  const Indexed({
    required this.child,
    this.index = 0,
  });

  factory Indexed.fromWidget(
    Widget child, [
    int index = 1,
  ]) {
    return Indexed(
      index: index,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) => child;
}

class Indexer extends Stack {
  final bool reversed;

  Indexer({
    this.reversed = false,
    List<Widget> children = const <Widget>[],
  }) : super(
          children: children
            ..sort((Widget a, Widget b) {
              final int _reverser = reversed ? -1 : 1;
              int _aIndex = 1;
              int _bIndex = 1;
              if (a is IndexedInterface) {
                _aIndex = (a as IndexedInterface).index;
              }
              if (b is IndexedInterface) {
                _bIndex = (b as IndexedInterface).index;
              }
              return _aIndex - _bIndex * _reverser;
            }),
        );

  Indexer.shadow({
    this.reversed = false,
    List<Widget> children = const <Widget>[],
    List<int> shadow = const <int>[],
  })  : assert(shadow.length == children.length),
        super(
          children: children
            ..sort((Widget a, Widget b) {
              final int _reverser = reversed ? -1 : 1;
              return shadow[children.indexOf(a)] - shadow[children.indexOf(b)] * _reverser;
            }),
        );
}
