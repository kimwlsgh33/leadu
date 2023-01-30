// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:leadu/src/presenter/riverpod/riverpod_main.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';


// @riverpod
// String helloWorld(HelloWorldRef ref) => 'Hello world';
//
// void main(List<String> args) {
//   runApp(ProviderScope(child: MyApp()));
// }
//
// class MyApp extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final String value = ref.watch(helloWorldProvider);
//
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Riverpod Annotation'),
//         ),
//         body: Center(
//           child: Text(value),
//         ),
//       ),
//     );
//   }
// }
