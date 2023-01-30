import 'package:flutter/material.dart';
import '../../../../domain/entities/goal.dart';

class AnswerCard extends StatelessWidget {
  final Function() onRemove;
  final Goal goal;
  const AnswerCard({
    super.key,
    required this.onRemove,
    required this.goal,
  });

  @override
  Widget build(BuildContext context) {
    print('AnswerCard build');
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        // color: goal.category.color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              goal.content,
              // goal.category.name,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              goal.content,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          IconButton(
            onPressed: onRemove,
            // setState(() {
            //   questList.removeAt(index);
            // });
            icon: const Icon(Icons.delete, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
