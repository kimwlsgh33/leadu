import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:leadu/src/base/utils.dart';
//==============================================================================
import 'package:leadu/src/config/routes/getx_routes.dart';
import 'package:leadu/src/model/entities/goal.dart';
import 'package:leadu/src/presenter/blocs/providers/goal_bloc.dart';
import 'package:leadu/src/presenter/views/goals/components/answer_card.dart';
import 'package:leadu/src/presenter/widgets/error_container.dart';
import 'package:leadu/src/presenter/widgets/goal_btn_bar.dart';
import 'package:leadu/src/presenter/widgets/list_item.dart';
import 'package:leadu/src/presenter/widgets/success_container.dart';
import 'package:leadu/src/presenter/widgets/typing_card.dart';

import '../../widgets/full_textfield.dart';

class GoalDetailScreen extends StatefulWidget {
  final Goal goal;

  const GoalDetailScreen({
    super.key,
    required this.goal,
  });

  @override
  State<GoalDetailScreen> createState() => _GoalDetailScreenState();
}

class _GoalDetailScreenState extends State<GoalDetailScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    onAdd(String value) =>
        context.read<GoalBloc>().add(AddGoal(value, parentId: widget.goal.id));

    return Scaffold(
      appBar: AppBar(
        title: const TypingCard(text: '어떻게?'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.backspace_rounded),
            onPressed: () => Get.offAllNamed(GetRouter.home),
            tooltip: '목표 목록으로 돌아가기',
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Hero(
                  tag: UniqueKey(),
                  child: AnswerCard(goal: widget.goal, isDetail: true),
                ),
                smallVerticalSpace(),
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget goalListBuilder(BuildContext context, List<Goal> goals) {
    var children = goals.where((e) => e.parentId == widget.goal.id).toList();

    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: children.length,
        itemBuilder: (context, index) =>
            ListItem(goal: children[index], index: index),
        separatorBuilder: (context, index) => smallVerticalSpace(),
      ),
    );
  }
}
