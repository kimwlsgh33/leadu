import 'package:leadu/src/domain/entities/goal.dart';
import 'package:leadu/src/domain/repositories/goal_repository.dart';

class GetGoals implements UseCase<List<Goal>, NoParams> {
  final GoalRepository repository;

  GetGoals(this.repository);

  @override
  Future<Either<Failure, List<Goal>>> call(NoParams params) async {
    return await repository.getGoals();
  }
}
  

