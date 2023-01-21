import 'package:flutter/material.dart';
import 'package:leadu/src/config/theme.dart';

class QuestScreen extends StatefulWidget {
  const QuestScreen({super.key});

  @override
  State<QuestScreen> createState() => _QuestScreenState();
}

class _QuestScreenState extends State<QuestScreen> {
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));

    return Scaffold(
      backgroundColor: kBgDarkColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            // TODO: alert change
          },
          icon: const Icon(Icons.shower),
        ),
        title: const Text("Quest"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.mp),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  '오늘의 퀘스트',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: 'Hint',
                      border: inputBorder,
                      focusedBorder: inputBorder,
                      enabledBorder: inputBorder,
                      filled: true,
                      contentPadding: const EdgeInsets.all(8),
                    ),
                    keyboardType: TextInputType.text,
                    // obscureText: true,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
