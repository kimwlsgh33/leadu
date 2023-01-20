import 'package:flutter/material.dart';
import 'package:leadu/src/presenter/providers/model/count_model.dart';
import 'package:leadu/src/presenter/providers/view/count_view.dart';
import 'package:provider/provider.dart';

class CountPage extends StatelessWidget {
  const CountPage({super.key});

  @override
  Widget build(BuildContext context) {
    // context내부에 있는 CountModel을 가져옴
    final countModel = Provider.of<CountModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Management - Provider'),
      ),
      body: const CountView(),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            // CountModel의 increment()를 호출
            onPressed: () => countModel.increment(),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            // CountModel의 decrement()를 호출
            onPressed: () => countModel.decrement(),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
