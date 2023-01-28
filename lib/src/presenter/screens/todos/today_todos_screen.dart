import 'package:flutter/material.dart';

class TodayTodoScreen extends StatelessWidget {
  const TodayTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '오늘 할 일',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Text('Todo Screen'),
      ),
    );
  }
}
