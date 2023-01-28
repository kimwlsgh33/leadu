import 'package:flutter/material.dart';

class Quest1 extends StatelessWidget {
  const Quest1({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              '만약 어떤 목표라도 성취할수있는\n 능력을 가지고 있다면,',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
              // maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
