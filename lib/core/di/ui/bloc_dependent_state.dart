import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BlocDependentState<W extends StatefulWidget, G extends Bloc<E, S>, E, S>
    extends State<W> {
  late G bloc;

  @override
  void initState() {
    bloc = context.read<G>();

    super.initState();
  }

  bool buildWhen(S previous, S current) => true;

  bool listenWhen(S previous, S current) => true;

  Widget builder(
    BuildContext context,
    S state,
  );

  void listener(
    BuildContext context,
    S state,
  ) {}

  void preBuild(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    preBuild(context);
    final consumer = BlocConsumer<G, S>(
      buildWhen: buildWhen,
      listenWhen: listenWhen,
      builder: (context, state) => builder(context, state),
      listener: (context, state) => listener(context, state),
    );

    return consumer;
  }
}
