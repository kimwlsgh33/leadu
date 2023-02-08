import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leadu/src/model/entities/goal.dart';
import 'package:leadu/src/model/repositories/goal_repository.dart';
import 'package:logger/logger.dart';

abstract class DoneEvent {}

class InitDone extends DoneEvent {}

class DoneBloc extends Bloc<DoneEvent, List<Goal>> {
  late List<Goal> _goals;
  get goals => _goals;
  Logger logger = Logger();

  DoneBloc() : super(<Goal>[]) {
    on<InitDone>(_onInitDone);
  }

  void _onInitDone(InitDone event, Emitter<List<Goal>> emit) async {
    _goals = await GoalRepository.getAll();
    emit(_goals);
  }
}
