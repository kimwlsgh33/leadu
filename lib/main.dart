import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadu/src/presenter/controller/count_controller.dart';
// import 'package:logger/logger.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
import './src/presenter/screens/main/main_screen.dart';

Future<void> main(List<String> args) async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Supabase.initialize(
  //   url: "https://gkmoxnuzhrlqhebujivd.supabase.co",
  //   anonKey:
  //       "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdrbW94bnV6aHJscWhlYnVqaXZkIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzQyMTM1MDAsImV4cCI6MTk4OTc4OTUwMH0.-7udRBWdyHZmdRUzVQANOBTOU1LjwuyUFlac4m6wakc",
  // );
  runApp(const MyApp());
}

// App 초기설정, 전체 state 관리
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // late final StreamSubscription<AuthState> _authSubscription;
  // User? _user;
  // final Logger _logger = Logger();

  // @override
  // void initState() {
  //   super.initState();
  //   _authSubscription =
  //       Supabase.instance.client.auth.onAuthStateChange.listen((data) {
  //     final AuthChangeEvent event = data.event;
  //     final Session? session = data.session;
  //     setState(() {
  //       _user = session?.user;
  //       _logger.d("event: $event, user: ${_user?.email}");
  //     });
  //   });
  // }
  //
  // @override
  // void dispose() {
  //   _authSubscription.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LEADU',
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      initialBinding: BindingsBuilder(() {
        Get.put(CountController());
      }),
      initialRoute: '/',
      unknownRoute: GetPage(name: '/notfound', page: () => const Scaffold()),
      getPages: [
        GetPage(
          name: '/',
          page: () => const MainScreen(),
        ),
      ],
    );
  }
}
