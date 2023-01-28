import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../config/theme.dart';
import '../../../base/utils.dart';
import '../../../base/constant.dart';
import '../../../domain/entities/goal.dart';
import '../../../presenter/screens/quests/components/quest1.dart';
import '../../../presenter/screens/quests/components/answer_card.dart';

class QuestScreen extends StatefulWidget {
  const QuestScreen({super.key});

  @override
  State<QuestScreen> createState() => _QuestScreenState();
}

class _QuestScreenState extends State<QuestScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<Goal> questList = [];
  final List<bool> _selections = [true, false, false];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  addQuest() async {}

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));

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
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                        hintText: '원하는 것을 입력하세요',
                        border: inputBorder,
                        focusedBorder: inputBorder,
                        enabledBorder: inputBorder,
                        filled: true,
                        contentPadding: const EdgeInsets.only(
                          left: 16,
                          right: 8,
                          top: 8,
                          bottom: 8,
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      // obscureText: true,
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
              addVerticalSpace(16),
              ToggleButtons(
                borderRadius: BorderRadius.circular(10),
                constraints: const BoxConstraints(minWidth: 100, minHeight: 50),
                isSelected: _selections,
                selectedBorderColor: kPrimaryColor,
                onPressed: (index) {
                  setState(() {
                    for (int i = 0; i < _selections.length; i++) {
                      if (i == index) {
                        _selections[i] = true;
                      } else {
                        _selections[i] = false;
                      }
                    }
                  });
                },
                children: const [
                  Text(
                    '가지겠다',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '하겠다',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '되겠다',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              addVerticalSpace(16),
              IconButton(
                iconSize: 50,
                padding: const EdgeInsets.all(0),
                onPressed: addQuest,
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
                child: ListView.builder(
                  itemCount: questList.length,
                  itemBuilder: (context, index) {
                    return AnswerCard(
                      goal: questList[index],
                      onRemove: (){} 
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
