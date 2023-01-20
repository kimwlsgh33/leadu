import 'package:flutter_bloc/flutter_bloc.dart';

// CountEvent라는 추상 클래스를 만들고, 이벤트를 상속받아 사용
abstract class CountEvent {}

class CountIncrementPressed extends CountEvent {}

class CountDecrementPressed extends CountEvent {}

class CountBloc extends Bloc<CountEvent, int> {
  CountBloc() : super(0) {
    // on() 메서드로 이벤트를 감지, 처리
    on<CountIncrementPressed>((event, emit) => emit(state + 1));
    on<CountDecrementPressed>((event, emit) => emit(state - 1));
  }
}
