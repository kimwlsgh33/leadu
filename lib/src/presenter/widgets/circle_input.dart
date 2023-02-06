import 'package:flutter/material.dart';

class CircleInput extends StatelessWidget {
  const CircleInput({
    super.key,
    required this.textController,
    required this.onSubmitted,
    this.hintText = '',
  });

  final TextEditingController textController;
  final Function(String) onSubmitted;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 100,
      width: 70,
      child: TextField(
        controller: textController,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 20),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 2,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).focusColor,
              width: 2,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        keyboardType: TextInputType.number,
        maxLength: 2,
        onSubmitted: onSubmitted,
      ),
    );
  }
}
