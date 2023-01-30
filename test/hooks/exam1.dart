import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Exam1 extends StatefulWidget {
  final Duration duration;
  const Exam1({
    super.key,
    required this.duration,
  });

  @override
  State<Exam1> createState() => _Exam1State();
}

// Mixin
class _Exam1State extends State<Exam1> with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    // duration상태를 받아와서 _controller에 넣어준다.
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
  }

  @override
  void didUpdateWidget(Exam1 oldWidget) {
    // duration이 변경되면 _controller를 변경해준다.
    super.didUpdateWidget(oldWidget);
    if (widget.duration != oldWidget.duration) {
      _controller!.duration = widget.duration;
    }
  }

  @override
  void dispose() {
    // _controller를 dispose해준다.
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

//==============================================================================
// HookWidget
//==============================================================================
class Exam2 extends HookWidget {
  final Duration duration;

  const Exam2({
    Key? key,
    required this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(duration: duration);
    return Container();
  }
}
//==============================================================================

// ValueNotifier<T> useLoggedState<T>([T initialData]) {
//   final result = useState<T>(initialData);
//   useValueChanged(result.value, (_, __) {
//     print(result.value);
//   });
//   return result;
// }

Result useMyHook() {
  return use(const _TimeAlive());
}

class _TimeAlive extends Hook<void> {
  const _TimeAlive();

  @override
  _TimeAliveState createState() => _TimeAliveState();
}

class _TimeAliveState extends HookState<void, _TimeAlive> {
  DateTime start;

  @override
  void initHook() {
    super.initHook();
    start = DateTime.now();
  }

  @override
  void build(BuildContext context) {}

  @override
  void dispose() {
    print(DateTime.now().difference(start));
    super.dispose();
  }
}
