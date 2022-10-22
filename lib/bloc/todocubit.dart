import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<List<bool>> {
  TodoCubit() : super([]);

  void add() {
    state.add(false);
    emit(state.toList());
  }
  
  void toggle(int pos) {
    state[pos] = !state[pos];
    emit(state.toList());
  }
}
