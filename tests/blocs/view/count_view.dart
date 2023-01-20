import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leadu/src/presenter/blocs/count_bloc.dart';
// import 'package:leadu/src/presenter/blocs/cubit/count_cubit.dart';

class CountView extends StatelessWidget {
  const CountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('State Management - Bloc')),
      body: Center(
        // BlocBulder로 CountCubit을 구독해, CountCubit의 상태가 변경되면 UI를 업데이트
        // child: BlocBuilder<CountCubit, int>(
        child: BlocBuilder<CountBloc, int>(
          builder: (BuildContext context, int state) {
            return Text('$state',
                style:
                    const TextStyle(fontSize: 40, fontWeight: FontWeight.bold));
          },
        ),
      ),
      // floatingActionButton은, absoulte position으로 구현
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            // CountCubit의 increment() 메서드를 호출
            // onPressed: () => context.read<CountCubit>().increment(),
            onPressed: () =>
                context.read<CountBloc>().add(CountIncrementPressed()),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            // onPressed: () => context.read<CountCubit>().decrement(),
            onPressed: () =>
                context.read<CountBloc>().add(CountDecrementPressed()),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
