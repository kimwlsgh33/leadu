import 'package:flutter/material.dart';
import 'package:leadu/src/domain/entities/goal.dart';

class GoalEditScreen extends StatelessWidget {
  const GoalEditScreen({
    super.key,
    required this.goal,
  });

  final Goal goal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Goal'),
      ),
      body: Center(
        child: Text(goal.content),
      ),
    );
  }
}
