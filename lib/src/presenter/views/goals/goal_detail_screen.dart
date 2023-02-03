import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leadu/src/config/routes/routes.dart';
import 'package:leadu/src/presenter/widgets/error_container.dart';
import 'package:leadu/src/presenter/widgets/goal_btn_bar.dart';
import 'package:leadu/src/presenter/widgets/success_container.dart';
import '../../widgets/full_textfield.dart';
import 'package:leadu/src/base/utils.dart';
import 'package:leadu/src/domain/entities/goal.dart';
import 'package:leadu/src/presenter/blocs/providers/goal_bloc.dart';
import 'package:leadu/src/presenter/views/goals/components/answer_card.dart';

class GoalDetailScreen extends StatefulWidget {
  Goal goal;
  GoalDetailScreen({
    super.key,
    required this.goal,
  });

  @override
  State<GoalDetailScreen> createState() => _GoalDetailScreenState();
}

class _GoalDetailScreenState extends State<GoalDetailScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    onAdd(String value) =>
        context.read<GoalBloc>().add(AddGoal(value, parentId: widget.goal.id));

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '어떻게 한다면',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Hero(
            tag: widget.goal.id,
            child: AnswerCard(goal: widget.goal, isDetail: true),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                FullRowTextField(
                  controller: _controller,
                  hintText: '계획을 입력해주세요',
                  onSubmitted: onAdd,
                ),
                smallVerticalSpace(),
                Hero(
                  tag: 'goalBtnBar',
                  child: GoalBtnBar(
                    controller: _controller,
                    onAdd: onAdd,
                  ),
                ),
              ],
            ),
          ),
          mediumVerticalSpace(),
          BlocBuilder<GoalBloc, List<Goal>>(builder: goalListBuilder)
        ],
      ),
    );
  }

  Widget goalListBuilder(BuildContext context, List<Goal> goals) {
    List<Goal> children =
        goals.where((e) => e.parentId == widget.goal.id).toList();

    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: children.length,
        itemBuilder: (context, index) => Dismissible(
          key: Key(children[index].id),
          background: const SuccessContainer(),
          secondaryBackground: const ErrorContainer(),
          onDismissed: (direction) {
            if (direction == DismissDirection.endToStart) {
              context.read<GoalBloc>().add(RemoveGoal(children[index]));
            } else {
              context.read<GoalBloc>().add(CompleteGoal(children[index]));
            }
          },
          child: AnswerCard(
            goal: children[index],
            onPressed: () {
              Navigator.pushNamed(
                context,
                AppRouter.goalDetail,
                arguments: children[index],
              );
            },
          ),
        ),
        separatorBuilder: (context, index) => smallVerticalSpace(),
      ),
    );
  }
}