import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart' as trans;
//==============================================================================
// import 'package:logger/logger.dart';
import 'package:leadu/src/config/routes/getx_routes.dart';
import 'package:leadu/src/config/theme.dart';
import 'package:leadu/src/presenter/blocs/observer.dart';
import 'package:leadu/src/presenter/blocs/providers/theme_bloc.dart';
import 'package:leadu/src/presenter/views/main/main_screen.dart';

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
  // final _logger = Logger();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (_) => ThemeBloc(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'LEADU',
        theme: msLightTheme,
        darkTheme: msDarkTheme,
        getPages: [
          GetPage(
            name: GetRouter.home,
            page: () => const MainScreen(),
            transition: trans.Transition.fade,
          ),
        ],
      ),
    );
  }
}
