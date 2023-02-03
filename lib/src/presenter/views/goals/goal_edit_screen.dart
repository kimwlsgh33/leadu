import 'package:flutter/material.dart';
import 'package:leadu/src/base/utils.dart';
import 'package:leadu/src/domain/entities/goal.dart';
import 'package:leadu/src/presenter/widgets/full_textfield.dart';

class GoalEditScreen extends StatefulWidget {
  const GoalEditScreen({
    super.key,
    required this.goal,
  });

  final Goal goal;

  @override
  State<GoalEditScreen> createState() => _GoalEditScreenState();
}

class _GoalEditScreenState extends State<GoalEditScreen> {
  late TextEditingController _textController; 

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: widget.goal.content);
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('목표 수정'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [

            Text(widget.goal.content),
            smallVerticalSpace(),
            FullRowTextField(
              controller: _textController,
              hintText: '계획을 입력해주세요',
              onSubmitted: (value) {},
              border: const OutlineInputBorder(),
            ),
          ],
        ),
      ),
    );
  }
}
