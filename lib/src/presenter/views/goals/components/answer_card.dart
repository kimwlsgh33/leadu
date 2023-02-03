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
    return Container(
      padding: isDetail ? const EdgeInsets.all(8) : null,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.1),
            blurRadius: isDetail ? 0 : 3,
            offset: isDetail ? const Offset(0, 0) : const Offset(0, 2),
            // spreadRadius: 3,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.surface,
          foregroundColor: Theme.of(context).colorScheme.onSurface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          disabledBackgroundColor: Theme.of(context).colorScheme.background,
          disabledForegroundColor: Theme.of(context).colorScheme.onSurface,
          elevation: 0,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              Material(
                shape: const CircleBorder(),
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  onTap: () => Navigator.pushNamed(
                    context,
                    AppRouter.goalDetail,
                    arguments: goal,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(8),
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
              const SizedBox(width: 10),
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
      ),
    );
  }
}
