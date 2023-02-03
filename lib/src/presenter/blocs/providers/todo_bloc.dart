
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leadu/src/base/utils.dart';
import 'package:leadu/src/domain/entities/goal.dart';
import 'package:leadu/src/domain/repositories/goal_repository.dart';

abstract class TodoEvent {}

class InitTodo extends TodoEvent {}

class AddTodo extends TodoEvent {
  final String text;
  AddTodo(this.text);
}

class DoneTodo extends TodoEvent {
  final Todo goal;
  DoneTodo(this.goal);
}

class RemoveTodo extends TodoEvent {
  final Todo goal;
  RemoveTodo(this.goal);
}

class ClearTodo extends TodoEvent {
  final BuildContext context;
  ClearTodo(this.context);
}

//============================================================
//============================================================

class TodoBloc extends Bloc<TodoEvent, List<Todo>> {
  TodoBloc() : super(<Todo>[]) {
    on<InitTodo>(_onInitTodo);
    on<AddTodo>((event, emit) {
      var goal = Todo(
        id: makeUUID(),
        content: event.text,
        goalDate: DateTime.now(),
      );
      TodoRepository.insert(goal);

      emit([...state, goal]);
    });
    on<DoneTodo>((event, emit) {
      emit([...state, event.goal]);
    });
    on<RemoveTodo>((event, emit) {
      TodoRepository.remove(event.goal);
      emit(state.where((element) => element != event.goal).toList());
    });
    on<ClearTodo>(
      (event, emit) {
        showDialog(
          context: event.context,
          builder: (context) => AlertDialog(
            title: const Text('Clear all goals?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  TodoRepository.removeAll();
                  emit([]);
                  Navigator.pop(context);
                },
                child: const Text('Clear'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _onInitTodo(InitTodo event, Emitter<List<Todo>> emit) async {
    var goals = await TodoRepository.getAll();
    emit(goals);
  }
}
