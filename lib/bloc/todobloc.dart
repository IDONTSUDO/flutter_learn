import 'package:flutter_bloc/flutter_bloc.dart';

part 'todobloc_event.dart';

part 'todobloc_state.dart';

class TodoBloc extends Bloc<TodoBlocEvent, TodoBlocState> {
  TodoBloc() : super(TodoBlocState()) {
    on<TodoBlocEvent>(
      _addTodo,
    );
  }

  _addTodo(TodoBlocEvent event, Emitter<TodoBlocState> emit) async {
    emit(TodoBlocState(todos: event.query));
  }
}
