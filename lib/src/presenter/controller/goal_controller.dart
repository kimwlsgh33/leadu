import 'package:get/get.dart';
import 'package:leadu/src/base/utils.dart';
import 'package:leadu/src/domain/entities/goal.dart';
import 'package:leadu/src/domain/repositories/goal_repository.dart';
import 'package:logger/logger.dart';

class GoalController extends GetxController {
  final Logger _logger = Logger();
  List<Goal> goalList = <Goal>[].obs;


  void init() async {
    goalList = await GoalRepository.getGoals();
    refresh();
  }

  void addGoal(String text) {
    _logger.d(text);
    var goal = Goal(
      id: makeUUID(),
      content: text,
      goalDate: DateTime.now(),
    );
    goalList.add(goal);
    refresh();
  }

  void setGoalList(List<Goal> goalList) {
    goalList = goalList;
    refresh();
  }

  void removeGoal(Goal goal) {
    goalList.remove(goal);
    refresh();
  }

  void updateGoal(Goal goal) {
    var index = goalList.indexWhere((element) => element.id == goal.id);
    goalList[index] = goal;
    refresh();
  }

  void removeAll() async {
    await GoalRepository.removeAll();
    goalList.clear();
    refresh();
  }
}
