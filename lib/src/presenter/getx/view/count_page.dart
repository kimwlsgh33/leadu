import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:leadu/src/presenter/getx/controller/count_controller.dart';

// GetView<CountController> 를 사용해서, View 내부에서 Controller를 사용할 수 있도록 한다.
class CountPage extends GetView<CountController> {
  const CountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Management - GetX'),
      ),
      body: Center(
        child: Obx(
          () => Text(
            // 상속받은 Controller의 count 변수를 사용한다.
            '${controller.count.value}',
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            // 상속받은 Controller의 increment 함수를 사용한다.
            onPressed: () => controller.increment(),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            // 상속받은 Controller의 decrement 함수를 사용한다.
            onPressed: () => controller.decrement(),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
