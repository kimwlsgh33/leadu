import 'package:flutter/material.dart';
import 'package:leadu/src/presenter/blocs/view/count_page.dart';

// MaterialApp의 home에 CountPage를 넣어준다.
class CountApp extends MaterialApp {
  const CountApp({Key? key}) : super(key: key, home: const CountPage());
}
