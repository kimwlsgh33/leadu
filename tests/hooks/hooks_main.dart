import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:leadu/src/presenter/hooks/navigation.dart';

void main() {
  runApp(const MyApp());
}

class TextScreen extends StatelessWidget {
  const TextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Screen'),
      ),
      body: const Center(
        child: Text('Hello World'),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  PageController pageController = PageController();
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hooks Example'),
        ),
        body: PageView(
            controller: pageController,
            onPageChanged: _onPageChanged,
            physics: const NeverScrollableScrollPhysics(),
            children: navScreens),
      ),
    );
  }
}

class HookExample extends HookWidget {
  const HookExample({super.key});

  @override
  Widget build(BuildContext context) {
    // 의존성에 따라 해당 함수가 호출됨
    useEffect(() {
      debugPrint('onInitState');
      return () {
        debugPrint('onDispose');
      };
    }, []);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Hook Example'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
