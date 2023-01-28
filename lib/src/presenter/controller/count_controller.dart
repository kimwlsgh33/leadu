import 'package:get/state_manager.dart';

class CountController extends GetxController {
  // RxInt 는 GetX의 Rx 타입으로, RxInt 는 int 타입을 감싸고 있다.
  RxInt count = 0.obs; // obs 는 Rx 타입을 감싸는 함수이다.

  void increment() {
    count++;
  }

  void decrement() {
    count--;
  }
}
