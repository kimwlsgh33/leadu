import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leadu/src/domain/entities/goal.dart';
import 'package:leadu/src/presenter/blocs/providers/goal_bloc.dart';
import 'package:leadu/src/presenter/views/goals/components/answer_card.dart';
import 'package:leadu/src/presenter/widgets/error_container.dart';
import 'package:leadu/src/presenter/widgets/full_textfield.dart';
import 'package:leadu/src/presenter/widgets/goal_btn_bar.dart';
import 'package:leadu/src/presenter/widgets/quest_card.dart';
import 'package:leadu/src/presenter/widgets/success_container.dart';
import '../../../base/utils.dart';
// import '../../../base/constant.dart';

class GoalScreen extends StatefulWidget {
  const GoalScreen({super.key});

  @override
  State<GoalScreen> createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> with TickerProviderStateMixin {
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // init goalBloc
    context.read<GoalBloc>().add(InitGoal());
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
                    onSubmitted: (value) {
                      context.read<GoalBloc>().add(AddGoal(value));
                    },
                  ),
                  smallVerticalSpace(),
                  Hero(
                    tag: 'goalBtnBar',
                    child: GoalBtnBar(
                      onAdd: (value) =>
                          context.read<GoalBloc>().add(AddGoal(value)),
                      controller: _textController,
                    ),
                  ),
                  mediumVerticalSpace()
                ],
              ),
            ),
            // const GoalList(),
            const Expanded(
                child: BlocBuilder<GoalBloc, List<Goal>>(
                    builder: goalListBuilder)),
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
}

Widget goalListBuilder(BuildContext context, List<Goal> goals) {
  List<Goal> roots =
      goals.where((element) => element.parentId == "root").toList();

  if (roots.isEmpty) {
    return const SizedBox(
      height: 100,
      child: Text("목표가 없습니다."),
    );
  }

  return ListView.separated(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    itemCount: roots.length,
    itemBuilder: (context, index) => Dismissible(
      key: Key(roots[index].id),
      background: const SuccessContainer(),
      secondaryBackground: const ErrorContainer(),
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          context.read<GoalBloc>().add(RemoveGoal(roots[index]));
          showSnackBar(context, "목표가 삭제되었습니다.");
        } else {
          context.read<GoalBloc>().add(CompleteGoal(roots[index]));
          showSnackBar(context, "목표가 완료되었습니다.");
        }
      },
      confirmDismiss: (direction) {
        if (direction == DismissDirection.endToStart) {
          return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("삭제하시겠습니까?"),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: const Text("삭제"),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: const Text("취소"),
                  ),
                ],
              );
            },
          );
        } else {
          return Future.value(true);
        }
      },
      child: Hero(
        tag: roots[index].id,
        child: AnswerCard(
          goal: roots[index],
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/goal_detail',
              arguments: roots[index],
            );
          },
          onRemove: () {
            context.read<GoalBloc>().add(RemoveGoal(goals[index]));
          },
        ),
      ),
    ),
    separatorBuilder: (context, index) => smallVerticalSpace(),
  );
}
