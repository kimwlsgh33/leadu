import 'dart:math';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

// 알림을 보내는 기능 ( 자주 사용하므로 따로 빼놓음 )
showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}

Widget addVerticalSpace(double height) {
  return SizedBox(
    height: height,
  );
}

Widget addHorizontalSpace(double width) {
  return SizedBox(
    width: width,
  );
}

String makeUUID() => const Uuid().v4();

double randomValue() =>
    (100 * (1 + (Random().nextDouble() * 100))).roundToDouble();
