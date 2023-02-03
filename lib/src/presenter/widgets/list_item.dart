import 'package:flutter/material.dart';
import 'package:leadu/src/base/utils.dart';
import 'package:leadu/src/domain/entities/goal.dart';
import 'package:leadu/src/presenter/views/goals/components/answer_card.dart';
import 'package:leadu/src/presenter/widgets/error_container.dart';
import 'package:leadu/src/presenter/widgets/success_container.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.goal,
    required this.animation,
    required this.onRemove,
    required this.onCompleted,
  });

  final Goal goal;
  final Animation<double> animation;
  final Function() onRemove;
  final Function() onCompleted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        child: Dismissible(
          key: Key(goal.id),
          background: const SuccessContainer(),
          secondaryBackground: const ErrorContainer(),
          onDismissed: (direction) {
            if (direction == DismissDirection.endToStart) {
              // logic for delete
              onRemove();
              showSnackBar(context, "목표가 삭제되었습니다.");
            } else {
              onCompleted();
              showSnackBar(context, "목표가 완료되었습니다.");
            }
          },
          confirmDismiss: (direction) {
            if (direction == DismissDirection.endToStart) {
              return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("삭제하시겠습니까?"),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, true);
                        },
                        child: const Text("삭제"),
                      ),
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: const Text("취소"),
                      ),
                    ],
                  );
                },
              );
            } else {
              return Future.value(true);
            }
          },
          child: SizeTransition(
            sizeFactor: animation,
            child: Hero(
              tag: goal.id,
              child: AnswerCard(
                goal: goal,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/goal_detail',
                    arguments: goal,
                  );
                },
                onRemove: onRemove,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
