import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leadu/src/model/entities/goal.dart';
import 'package:leadu/src/presenter/blocs/providers/goal_bloc.dart';

class TomorrowScreen extends StatelessWidget {
  const TomorrowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tomorrow'),
      ),
      body: BlocBuilder<GoalBloc, List<Goal>>(builder: (context, state) {
        return ListView.separated(
          itemCount: state.length,
          itemBuilder: (context, item) {},
          separatorBuilder: (context, item) => const Divider(),
        );
      }),
    );
  }
}
