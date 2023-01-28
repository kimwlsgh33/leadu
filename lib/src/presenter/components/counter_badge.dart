import 'package:flutter/material.dart';
import '../../config/theme.dart';
import '../../base/extensions.dart';

class CounterBadge extends StatelessWidget {
  final int count;
  const CounterBadge({
    super.key,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 2,
      ),
      decoration: const BoxDecoration(
        color: kBadgeColor,
        borderRadius: BorderRadius.all(Radius.circular(9)),
      ),
      child: Text(
        count.toString(),
        style: Theme.of(context).textTheme.caption!.copyWith(
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
      ).addNeumorphism(
        topShadowColor: Colors.white,
        bottomShadowColor: const Color(0xFF234395).withOpacity(0.2),
      ),
    );
  }
}
