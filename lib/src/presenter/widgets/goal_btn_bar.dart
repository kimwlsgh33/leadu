import 'package:flutter/material.dart';
import 'package:leadu/src/base/utils.dart';
import './full_icon_button.dart';
import './outlined_icon_button.dart';

class GoalBtnBar extends StatelessWidget {
  final Function(String text) onAdd;
  final TextEditingController _controller;
  const GoalBtnBar({
    super.key,
    required TextEditingController controller,
    required this.onAdd,
  }) : _controller = controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          OutlinedIconButton(
            icon: Icons.calendar_month,
            onTap: () {},
            color: Theme.of(context).colorScheme.primary,
          ),
          smallHorizontalSpace(),
          OutlinedIconButton(
            icon: Icons.notifications_rounded,
            onTap: () {},
            color: Theme.of(context).colorScheme.primary,
          ),
          smallHorizontalSpace(),
          OutlinedIconButton(
            icon: Icons.repeat_rounded,
            onTap: () {},
            color: Theme.of(context).colorScheme.primary,
          ),
          const Spacer(),
          FullIconButton(
            icon: Icons.add_circle_outline_rounded,
            onTap: () {
              if (_controller.text.isNotEmpty) {
                onAdd(_controller.text);
                _controller.clear();
              }
            },
            color: Theme.of(context).colorScheme.background,
            bgColor: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
