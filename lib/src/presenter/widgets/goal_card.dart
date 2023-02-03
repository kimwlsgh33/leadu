import 'package:flutter/material.dart';
import 'package:leadu/src/base/constant.dart';
import 'package:leadu/src/domain/entities/goal.dart';

class GoalCard extends StatelessWidget {
  Goal goal;
  GoalCard({
    super.key,
    required this.goal,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: ListTile(
            contentPadding: const EdgeInsets.all(8),
            leading: Container(
              alignment: Alignment.center,
              width: circleMidSize,
              height: circleMidSize,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(circleMidSize),
                border: Border.all(
                  color: Colors.blue,
                  width: 1,
                ),
              ),
              child: Text(
                goal.priority.toString(),
                // goal.category.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.blue,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            title: const Text('목표'),
            subtitle: Text(goal.content),
            // trailing: const Icon(Icons.arrow_forward_ios),
          ),
        ),
        
      ],
    );
  }
}
