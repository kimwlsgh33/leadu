import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class Observer extends BlocObserver {
  var logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: false,
      printEmojis: true,
      printTime: true,
    ),
  );

  // @override
  // void onChange(BlocBase bloc, Change change) {
  //   logger.i(change);
  //   super.onChange(bloc, change);
  // }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    logger.i(transition);
    super.onTransition(bloc, transition);
  }
}
