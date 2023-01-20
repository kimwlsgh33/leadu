import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leadu/src/presenter/blocs/count_bloc.dart';
// import 'package:leadu/src/presenter/blocs/cubit/count_cubit.dart';
import 'package:leadu/src/presenter/blocs/view/count_view.dart';

// Page에서 BlocProvider를 사용하여 Cubit을 생성 ( 이 화면에서만 사용 )
class CountPage extends StatelessWidget {
  const CountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // create: (_) => CountCubit(),
      create: (_) => CountBloc(),
      child: const CountView(),
    );
  }
}
