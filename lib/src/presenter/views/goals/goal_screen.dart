import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadu/src/base/common/full_textfield.dart';
import 'package:leadu/src/domain/entities/goal.dart';
import 'package:leadu/src/presenter/controller/goal_controller.dart';
import 'package:leadu/src/presenter/views/goals/components/answer_card.dart';
import 'package:leadu/src/presenter/views/quests/quest1.dart';
import '../../../config/theme.dart';
import '../../../base/utils.dart';
// import '../../../base/constant.dart';

class GoalScreen extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();
  late GoalController _goalController;

  void _addGoal() {
    _goalController.addGoal(_textController.text);
    _textController.clear();
  }

  void _removeGoal(Goal goal) {
    _goalController.removeGoal(goal);
  }

  @override
  Widget build(BuildContext context) {
    _goalController = Get.put(GoalController());
    _goalController.init();
    return Scaffold(
      backgroundColor: kBgDarkColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Quest1(),
              addVerticalSpace(16),
              FullRowTextField(controller: _textController),
              addVerticalSpace(16),
              IconButton(
                iconSize: 50,
                padding: const EdgeInsets.all(0),
                onPressed: _addGoal,
                style: IconButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(16),
                  backgroundColor: kPrimaryColor,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                icon: Icon(
                  Icons.add_circle_rounded,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              addVerticalSpace(16),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemCount: _goalController.goalList.length,
                    itemBuilder: (context, index) => AnswerCard(
                      goal: _goalController.goalList[index],
                      onRemove: () => _removeGoal,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Get.toNamed('/today');
          _goalController.removeAll();
        },
        child: const Icon(Icons.close),
      ),
    );
  }
}
