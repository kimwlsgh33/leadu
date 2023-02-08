import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:leadu/src/config/routes/getx_routes.dart';
import 'package:leadu/src/model/entities/goal.dart';
import 'package:leadu/src/base/utils.dart';
import 'package:leadu/src/presenter/blocs/providers/goal_bloc.dart';
import 'package:leadu/src/presenter/views/goals/components/answer_card.dart';
import 'package:leadu/src/presenter/widgets/error_container.dart';
import 'package:leadu/src/presenter/widgets/success_container.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.goal,
    required this.index,
  });

  final Goal goal;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoalBloc, List<Goal>>(builder: (context, goals) {
      return Dismissible(
        key: Key(goal.id),
        background: const SuccessContainer(),
        secondaryBackground: const ErrorContainer(),
        onDismissed: (direction) {
          if (direction == DismissDirection.endToStart) {
            // logic for delete
            context.read<GoalBloc>().add(RemoveGoal(goal));
            showSnackBar(context, "목표가 삭제되었습니다.");
          } else {
            context.read<GoalBloc>().add(RemoveGoal(goal));
            Get.snackbar(
              '달성 완료',
              "목표를 달성하셨습니다.",
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.blue,
              colorText: Colors.white,
              duration: const Duration(seconds: 2),
            );
          }
        },
        confirmDismiss: (direction) {
          if (direction == DismissDirection.endToStart) {
            return Get.dialog(AlertDialog(
              title: const Text("삭제하시겠습니까?"),
              content: const Text("하위 목표까지 모두 삭제됩니다."),
              actions: [
                ElevatedButton(
                  onPressed: () => Get.back(),
                  child: const Text("삭제"),
                ),
                ElevatedButton(
                  onPressed: () => Get.back(),
                  child: const Text("취소"),
                ),
              ],
            ));
          } else {
            if (goals
                .where((element) => element.parentId == goal.id)
                .isNotEmpty) {
              return Get.dialog(
                AlertDialog(
                  title: const Text("하위 목표가 존재합니다."),
                  content: const Text("정말 달성하셨나요?"),
                  actions: [
                    ElevatedButton(
                      onPressed: () => Get.back(),
                      child: const Text("달성"),
                    ),
                    ElevatedButton(
                      onPressed: () => Get.back(),
                      child: const Text("취소"),
                    ),
                  ],
                ),
              );
            }
            return Future.value(true);
          }
        },
        child: Hero(
          tag: goal.id,
          child: AnswerCard(
            goal: goal,
            onPressed: () => Get.toNamed(
              "${GetRouter.goalDetail}/id=${goal.id}",
              arguments: goal,
            ),
          ),
        ),
      );
    });
  }
}
