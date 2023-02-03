import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leadu/src/base/utils.dart';
import 'package:leadu/src/model/entities/goal.dart';
import 'package:leadu/src/model/repositories/goal_repository.dart';
import 'package:rxdart/rxdart.dart';

abstract class PlanEvent {}

//==============================================================================
// Event 객체를 만들어서 Bloc에 전달
//==============================================================================
class InitPlan extends PlanEvent {}

class AddPlan extends PlanEvent {
  final String text;
  final String parentId;
  AddPlan(
    this.text, {
    this.parentId = 'root',
  });
}

class RemovePlan extends PlanEvent {
  final Goal goal;
  RemovePlan(this.goal);
}

class EditPlan extends PlanEvent {
  final Goal goal;
  EditPlan(this.goal);
}

class CompletePlan extends PlanEvent {
  final Goal goal;
  CompletePlan(this.goal);
}

class UpdatePlan extends PlanEvent {
  final Goal goal;
  UpdatePlan(this.goal);
}

//==============================================================================
// dev
//==============================================================================
class ClearPlan extends PlanEvent {
  final BuildContext context;
  ClearPlan(this.context);
}

class DeleteDatabase extends PlanEvent {}

EventTransformer<T> debounceTime<T>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).switchMap(mapper);
}

//============================================================
// Bloc 객체
//============================================================
class PlanBloc extends Bloc<PlanEvent, List<Goal>> {
  late List<Goal> _goals;
  get goals => _goals;

  PlanBloc() : super(<Goal>[]) {
    on<InitPlan>(_onInitPlan);
    on<AddPlan>(
      _addPlan,
      transformer: droppable(),
    );
    on<RemovePlan>(_removePlan);
    on<CompletePlan>(_completePlan);
    on<EditPlan>(_editPlan);
    //========================================================
    // dev
    //========================================================
    on<ClearPlan>(
      _clearPlan,
      transformer: debounceTime<ClearPlan>(const Duration(milliseconds: 1000)),
    );
    on<DeleteDatabase>((event, emit) {
      GoalRepository.deleteDatabase();
    });
  }

  //================================================================
  // Bloc에 전달된 Event를 처리하는 함수
  //================================================================
  void _onInitPlan(InitPlan event, Emitter<List<Goal>> emit) async {
    if (state.isEmpty) {
      _goals = await GoalRepository.getRoots();
      emit(_goals);
    }
  }

  void _addPlan(event, emit) {
    var goal = Goal(
      id: makeUUID(),
      parentId: event.parentId,
      content: event.text,
      goalDate: DateTime.now(),
    );
    GoalRepository.insert(goal);

    emit([...state, goal]);
  }

  void _removePlan(event, emit) {
    GoalRepository.remove(event.goal);
    emit(state.where((element) => element != event.goal).toList());
  }

  void _completePlan(event, emit) {
    var goal = event.goal.copyWith(done: true);
    GoalRepository.update(goal);
    emit(state.where((element) => element != event.goal).toList());
  }

  void _editPlan(event, emit) {
    GoalRepository.update(event.goal);
    emit(state);
  }

  //================================================================
  // dev
  //================================================================
  void _clearPlan(event, emit) {
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
            onPressed: () async {
              GoalRepository.removeAll().whenComplete(() {
                Navigator.pop(context);
                InitPlan();
              });
            },
            child: const Text('Clear'),
          ),
        ],
      ),
    );
  }
}
