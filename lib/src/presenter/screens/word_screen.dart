import 'package:flutter/material.dart';

class WordScreen extends StatelessWidget {
  const WordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Word"),
      ),
      body: Center(
        child: Text(
          '어떤 계획이든, 무계획보다는 낫다.',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
