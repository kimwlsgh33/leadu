import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:leadu/src/domain/entities/goal.dart';
import 'package:leadu/src/presenter/views/goals/components/answer_card.dart';

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
        // elevation: 2,
        child: SizeTransition(
          sizeFactor: animation,
          child: Slidable(
            key: ValueKey(goal.id),
            startActionPane: ActionPane(
              motion: const ScrollMotion(),
              dragDismissible: false,
              extentRatio: 0.3,
              children: [
                SlidableAction(
                  icon: Icons.check_circle_rounded,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                  onPressed: (_) {
                    onCompleted();
                  },
                ),
                SlidableAction(
                  icon: Icons.share,
                  backgroundColor: Colors.lightGreen,
                  foregroundColor: Colors.white,
                  onPressed: (_) {},
                ),
              ],
            ),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              dragDismissible: false,
              extentRatio: 0.15,
              children: [
                SlidableAction(
                  icon: Icons.delete,
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(0),
                  onPressed: (_) {
                    onRemove();
                  },
                ),
              ],
            ),
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
