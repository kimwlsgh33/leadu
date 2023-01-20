import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// State 저장
final helloWorldProvider = Provider<String>((ref) => 'Hello world');
final countStateProvider = StateProvider<int>((ref) => 0);
//
void main(List<String> args) {
  runApp(ProviderScope(child: MyHomePage()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// ConsumerWidget을 상속받으면, build 메소드에 ref를 받아올 수 있다.
class MyHomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // watch를 통해 Provider를 감시
    var value = ref.watch(countStateProvider);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Riverpod'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$value',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                ref.read(countStateProvider.notifier).state++;
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 20),
            FloatingActionButton(
              onPressed: () {
                ref.read(countStateProvider.notifier).state--;
              },
              child: const Icon(Icons.remove),
            )
          ],
        ),
      ),
    );
  }
}

// class MyApp extends HookConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final helloWorld = ref.watch(helloWorldProvider);
//
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Text(helloWorld),
//         ),
//       ),
//     );
//   }
// }
