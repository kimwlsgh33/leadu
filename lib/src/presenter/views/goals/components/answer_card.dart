import 'package:flutter/material.dart';
import 'package:leadu/src/base/utils.dart';
import 'package:leadu/src/config/routes/routes.dart';
import '../../../../domain/entities/goal.dart';

class AnswerCard extends StatelessWidget {
  final Function()? onRemove;
  final Function()? onPressed;
  final Goal goal;
  final bool isDetail;
  const AnswerCard({
    super.key,
    this.onRemove,
    this.onPressed,
    required this.goal,
    this.isDetail = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        disabledBackgroundColor: Theme.of(context).colorScheme.surface,
        disabledForegroundColor: Theme.of(context).colorScheme.onSurface,
        elevation: 2,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 2),
        child: Row(
          children: [
            Material(
              shape: const CircleBorder(),
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                onTap: () => Navigator.pushNamed(
                  context,
                  AppRouter.goalEdit,
                  arguments: goal,
                ),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                      width: 2,
                    ),
                  ),
                  child: Text(
                    goal.priority.toString(),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            smallHorizontalSpace(),
            Expanded(
              child: Text(
                goal.content,
                style: const TextStyle(
                  fontSize: 18,
                  // fontWeight: FontWeight.w700,
                ),
                maxLines: 3,
              ),
            ),
            smallHorizontalSpace(),
            Text(
              goal.done ? '완료' : '미완료',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: goal.done
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.error,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
