import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

// BlocObserver는 Bloc의 모든 인스턴스에 대한 이벤트를 관찰한다.
class CountObserver extends BlocObserver {
  var logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
  );
  @override
  void onChange(BlocBase bloc, Change change) {
    logger.d(change);
    super.onChange(bloc, change);
  }
}
