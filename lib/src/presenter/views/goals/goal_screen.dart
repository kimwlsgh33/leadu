import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leadu/src/domain/entities/goal.dart';
import 'package:leadu/src/presenter/blocs/providers/goal_bloc.dart';
import 'package:leadu/src/presenter/widgets/full_textfield.dart';
import 'package:leadu/src/presenter/widgets/goal_btn_bar.dart';
import 'package:leadu/src/presenter/widgets/list_item.dart';
import 'package:leadu/src/presenter/widgets/quest_card.dart';

import '../../../base/utils.dart';
// import '../../../base/constant.dart';

class GoalScreen extends StatefulWidget {
  const GoalScreen({super.key});

  @override
  State<GoalScreen> createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> with TickerProviderStateMixin {
  final TextEditingController _textController = TextEditingController();
  final _listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    // init goalBloc
    context.read<GoalBloc>().add(InitGoal());

    void onAdd(value) {
      context.read<GoalBloc>().add(AddGoal(value));
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const QuestCard(
                    quest: '만약 어떤 목표라도 성취할수있는\n 능력을 가지고 있다면?',
                    icon: Icons.where_to_vote_rounded,
                  ),
                  smallVerticalSpace(),
                  FullRowTextField(
                    controller: _textController,
                    hintText: '원하는 것 추가하기',
                    onSubmitted: onAdd,
                  ),
                  smallVerticalSpace(),
                  Hero(
                    tag: 'goalBtnBar',
                    child: GoalBtnBar(
                      onAdd: onAdd,
                      controller: _textController,
                    ),
                  ),
                  mediumVerticalSpace()
                ],
              ),
            ),
            // const GoalList(),
            Expanded(
              child: BlocBuilder<GoalBloc, List<Goal>>(
                  builder: (BuildContext context, List<Goal> goals) {
                var roots = goals
                    .where((element) => element.parentId == "root")
                    .toList();
                // var roots = goals;

                if (roots.isEmpty) {
                  return const SizedBox(
                    height: 100,
                    child: Text("목표가 없습니다."),
                  );
                }

                return ListView.separated(
                  key: _listKey,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: roots.length,
                  itemBuilder: (context, index) => ListItem(
                    key: ValueKey(roots[index].id),
                    goal: roots[index],
                    onRemove: () =>
                        context.read<GoalBloc>().add(RemoveGoal(roots[index])),
                    onCompleted: () => context
                        .read<GoalBloc>()
                        .add(CompleteGoal(roots[index])),
                  ),
                  separatorBuilder: (context, index) => smallVerticalSpace(),
                );
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // context.read<GoalBloc>().add(());
        },
        child: const Icon(Icons.close),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
