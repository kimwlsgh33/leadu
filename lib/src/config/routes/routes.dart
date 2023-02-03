import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leadu/src/domain/entities/goal.dart';
import 'package:leadu/src/presenter/blocs/providers/goal_bloc.dart';
import 'package:leadu/src/presenter/views/goals/goal_detail_screen.dart';
import 'package:leadu/src/presenter/views/goals/goal_edit_screen.dart';
import 'package:leadu/src/presenter/views/main/main_screen.dart';

class AppRouter {
  static const String home = '/';
  static const String about = 'about';
  static const String goalDetail = '/goal_detail';
  static const String goalEdit = '/goal_edit';
  final GoalBloc _goalBloc = GoalBloc();

  void dispose() {
    _goalBloc.close();
  }

  Route<dynamic>? onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _goalBloc,
            child: const MainScreen(),
          ),
        );
      case goalDetail:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) {
            final goal = settings.arguments as Goal;

            // return GoalDetailScreen(goal: goal);
            return BlocProvider.value(
              value: _goalBloc,
              child: GoalDetailScreen(goal: goal),
            );
          },
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: animation.drive(
                Tween<double>(begin: 0.0, end: 1.0).chain(
                  CurveTween(curve: Curves.easeIn),
                ),
              ),
              child: child,
            );
          },
        );
      case goalEdit:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) {
            final goal = settings.arguments as Goal;

            // return GoalDetailScreen(goal: goal);
            return BlocProvider.value(
              value: _goalBloc,
              child: GoalEditScreen(goal: goal),
            );
          },
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: animation.drive(
                Tween<double>(begin: 0.0, end: 1.0).chain(
                  CurveTween(curve: Curves.easeIn),
                ),
              ),
              child: child,
            );
          },
        );
      // case '/today_todo':
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider.value(
      //       value: _goalBloc,
      //       child: const TodayScreen(),
      //     ),
      //   );
      // return MaterialPageRoute(
      //   builder: (_) => BlocProvider.value(
      //     value: _goalBloc,
      //     child: GoalDetailScreen(
      //       goal: settings.arguments as Goal,
      //     ),
      //   ),
      // );
      default:
        return null;
    }
  }
}
