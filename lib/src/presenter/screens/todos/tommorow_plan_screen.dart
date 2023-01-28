import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadu/src/data/datasources/local/plan_provider.dart';
import 'package:leadu/src/domain/entities/plan.dart';
import 'package:leadu/src/presenter/screens/todos/order_screen.dart';

class TomorrowPlan extends StatefulWidget {
  const TomorrowPlan({super.key});

  @override
  State<TomorrowPlan> createState() => _TomorrowPlanState();
}

class _TomorrowPlanState extends State<TomorrowPlan> {
  final TextEditingController _textController = TextEditingController();
  final List<Plan> _planItems = [];
  late PlanProvider _planProvider;

  void addPlan(String title) {
    if (title.isNotEmpty) {
      setState(() {
        _planItems.add(Plan(title: title));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: goGoal,
                      // child: Text('明日の予定'),
                      child: const Text('목표 확인'),
                    ),
                  ),
                ],
              ),
              // IntrinsicHeight : 자식들의 높이를 최대로 맞춰줌
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    ElevatedButton(
                      onPressed: onAdd,
                      child: const Text('추가'),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: goOrder,
                      // child: Text('明日の予定'),
                      child: const Text('우선 순위 정하기'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: (){
                  Get.changeTheme(ThemeData.dark());
                },
                child: const Text('초기화'),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _planItems.length,
                  itemBuilder: itemBuilder,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void deletePlan(int index) {
    setState(() {
      _planItems.removeAt(index);
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void goDetail(int index) {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => DetailPage(
    //       plan: _planItems[index],
    //       updatePlan: (title) => updatePlan(index, title),
    //     ),
    //   ),
    // );
  }

  void goGoal() {
    Navigator.pushNamed(context, '/goal');
  }

  void goOrder() {
    // Navigator.pushNamed(context, '/order');
    Get.to(OrderScreen());
  }

  void initPlan() async {
    await _planProvider.open('plan.db');
    final plan = await _planProvider.getPlan(1);
    setState(() {
      _planItems.add(plan);
    });
  }

  @override
  void initState() {
    super.initState();
    _planProvider = PlanProvider();
    initPlan();
  }

  Widget? itemBuilder(context, index) {
    final item = _planItems[index];
    return Dismissible(
      key: Key(item.id.toString()),
      onDismissed: (direction) {
        setState(() {
          _planItems.removeAt(index);
        });
      },
      child: ListTile(
        title: Text(item.title),
      ),
    );
  }

  void onAdd() {
    addPlan(_textController.text);
    _textController.clear();
  }

  void updatePlan(int index, String title) {
    setState(() {
      _planItems[index].title = title;
    });
  }
}
