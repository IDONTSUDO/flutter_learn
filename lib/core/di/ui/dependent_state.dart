import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class DependentState<W extends StatefulWidget, G extends BlocBase<S>, S> extends State<W> {
  late G cubit;

  @override
  void initState() {
    cubit = context.read<G>();

    super.initState();
  }

  bool buildWhen(S previous, S current) => true;

  bool listenWhen(S previous, S current) => true;

  Widget builder(BuildContext context, S state);

  void listener(BuildContext context, S state) {}

  @override
  Widget build(BuildContext context) {
    final consumer = BlocConsumer<G, S>(
      buildWhen: buildWhen,
      listenWhen: listenWhen,
      builder: (context, state) => builder(context, state),
      listener: (context, state) => listener(context, state),
    );

    return consumer;
  }
}
