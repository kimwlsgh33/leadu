import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leadu/src/config/routes/routes.dart';
import 'package:leadu/src/config/theme.dart';
import 'package:leadu/src/presenter/blocs/observer.dart';
import 'package:leadu/src/presenter/blocs/providers/theme_bloc.dart';
// import 'package:leadu/src/presenter/views/todos/today_screen.dart';

Future<void> main(List<String> args) async {
  // WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = Observer();
  runApp(const MyApp());
}

// App 초기설정, 전체 state 관리
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();

  @override
  void dispose() {
    _appRouter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'LEADU',
        theme: msLightTheme,
        darkTheme: msDarkTheme,
        onGenerateRoute: _appRouter.onGeneratedRoute,
      ),
    );
  }
}

// class _MyAppState extends State<MyApp> {
//   final AppRouter _appRouter = AppRouter();
//
//   @override
//   void dispose() {
//     _appRouter.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => ThemeBloc(),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'LEADU',
//         theme: msLightTheme,
//         darkTheme: msDarkTheme,
//         onGenerateRoute: _appRouter.onGeneratedRoute,
//       ),
//     );
//   }
// }
