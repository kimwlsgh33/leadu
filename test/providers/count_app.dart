import 'package:flutter/material.dart';
import 'package:leadu/src/presenter/providers/model/count_model.dart';
import 'package:leadu/src/presenter/providers/view/count_page.dart';
import 'package:provider/provider.dart';

class CountApp extends StatelessWidget {
  const CountApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State Management - Provider',
      // ChnageNotifierProvider를사용하여, CountPage의 context에 CountModel을 전달
      home: ChangeNotifierProvider<CountModel>(
        create: (_) => CountModel(),
        child: const CountPage(),
      ),
    );
  }
}
