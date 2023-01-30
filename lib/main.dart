import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadu/src/presenter/controller/goal_controller.dart';
import 'package:leadu/src/presenter/views/main/main_screen.dart';

Future<void> main(List<String> args) async {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

// App 초기설정, 전체 state 관리
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LEADU',
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      home: const MainScreen(),
    );
  }
}
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'LEADU',
//       theme: ThemeData(),
//       darkTheme: ThemeData.dark(),
//       initialBinding: BindingsBuilder(() {
//         Get.lazyPut(() => GoalController());
//       }),
//       initialRoute: '/',
//       unknownRoute: GetPage(name: '/notfound', page: () => const Scaffold()),
//       getPages: [
//         GetPage(
//           name: '/',
//           page: () => const MainScreen(),
//         ),
//       ],
//     );
//   }
// }
