import 'package:leadu/src/data/sources/local/goal_provider.dart';
import 'package:leadu/src/model/entities/goal.dart';

class GoalRepository {
  static final GoalProvider _goalProvider = GoalProvider();

  static Future<void> deleteDatabase() async {
    await _goalProvider.deleteDatabase();
  }

  static Future<List<Goal>> getAll() async {
    return await _goalProvider.getAll();
  }

  static Future<List<Goal>> getNotCompleted() async {
    return await _goalProvider.getNotCompleted();
  }

  static Future<List<Goal>> getRoots() async {
    return await _goalProvider.getRoots();
  }

  static Future<List<Goal>> getChildren(parentId) async {
    return await _goalProvider.getChildren(parentId);
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
