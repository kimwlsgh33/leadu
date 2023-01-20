import 'package:flutter/material.dart';
import 'package:leadu/src/presenter/providers/model/count_model.dart';
import 'package:provider/provider.dart';

class CountView extends StatelessWidget {
  const CountView({super.key});

  @override
  Widget build(BuildContext context) {
    // context내부에 있는 CountModel을 가져옴
    final countModel = Provider.of<CountModel>(context);
    return Center(
      child: Text('${countModel.count}',
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          )),
    );
  }
}
