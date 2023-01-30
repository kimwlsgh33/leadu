import 'package:flutter/material.dart';

// ChangeNotifier를 상속받아, 저장할 상태를 정의
class CountModel with ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    // notifyListeners()를 호출하여, 상태가 변경되었음을 알림
    notifyListeners();
  }

  void decrement() {
    count--;
    notifyListeners();
  }
}
