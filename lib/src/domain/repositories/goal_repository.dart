import 'package:leadu/src/data/sources/local/goal_provider.dart';
import 'package:leadu/src/domain/entities/goal.dart';

class GoalRepository {
  static final GoalProvider _goalProvider = GoalProvider();

  static Future<List<Goal>> getGoals() async {
    return await _goalProvider.getGoals();
  }

  static Future<Goal> getGoal(Goal goal) async {
    return await _goalProvider.getGoal(goal);
  }

  static Future<void> insert(Goal goal) async {
    await _goalProvider.insert(goal);
  }

  static Future<void> update(Goal goal) async {
    await _goalProvider.update(goal);
  }

  static Future<void> remove(Goal goal) async {
    await _goalProvider.remove(goal);
  }

  static Future<void> removeAll() async {
    await _goalProvider.removeAll();
  }
}
