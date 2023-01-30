import 'package:flutter/material.dart';

class FullRowTextField extends StatelessWidget {
  final TextEditingController controller;
  const FullRowTextField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
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
    );
  }
}
