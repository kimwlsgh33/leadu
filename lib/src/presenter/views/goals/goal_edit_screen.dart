import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leadu/src/base/utils.dart';
import 'package:leadu/src/model/entities/goal.dart';
import 'package:leadu/src/presenter/blocs/providers/goal_bloc.dart';
import 'package:leadu/src/presenter/widgets/circle_input.dart';
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
  late TextEditingController _priorityController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: widget.goal.content);
    _priorityController =
        TextEditingController(text: widget.goal.priority.toString());
  }

  @override
  void dispose() {
    _textController.dispose();
    _priorityController.dispose();
    super.dispose();
  }

  void _onSubmitted() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('목표 수정'),
        content: const Text('수정하시겠습니까?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('취소'),
          ),
          BlocSelector<GoalBloc, List<Goal>, Goal>(
              selector: (state) =>
                  state.firstWhere((element) => element.id == widget.goal.id),
              builder: (context, goal) {
                return TextButton(
                  onPressed: () {
                    context.read<GoalBloc>().add(EditGoal(goal));
                    Navigator.of(context).pop(widget.goal);
                  },
                  child: const Text('확인'),
                );
              }),
        ],
      ),
    );
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleInput(
              textController: _priorityController,
              onSubmitted: (value) {},
              hintText: '우선순위',
            ),
            smallVerticalSpace(),
            FullRowTextField(
              controller: _textController,
              hintText: '수정할 계획을 입력해주세요',
              onSubmitted: (value) {},
              border: const OutlineInputBorder(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.check),
      ),
    );
  }
}
