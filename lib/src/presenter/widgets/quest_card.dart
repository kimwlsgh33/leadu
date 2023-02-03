import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

const _cardRadius = 8.0;

class QuestCard extends StatelessWidget {
  final String quest;
  final IconData icon;

  const QuestCard({
    super.key,
    required this.quest,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_cardRadius),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(_cardRadius),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                icon,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            AnimatedTextKit(animatedTexts: [
              TypewriterAnimatedText(
                quest,
                textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                speed: const Duration(milliseconds: 100),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
