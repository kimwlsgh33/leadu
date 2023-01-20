import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leadu/src/presenter/blocs/count_app.dart';
import 'package:leadu/src/presenter/blocs/count_observer.dart';

void main(List<String> args) {
  // BlocOverrides는 CountApp에서 사용할 BlocObserver를 설정
  // ignore: deprecated_member_use
  BlocOverrides.runZoned(
    () => runApp(const CountApp()),
    blocObserver: CountObserver(),
  );
}
