import 'package:flutter/material.dart';
import 'package:leadu/src/presenter/responsive/desktop_screen.dart';
import 'package:leadu/src/presenter/responsive/mobile_screen.dart';
import '../responsive/responsive.dart';
import 'package:leadu/src/presenter/responsive/tablet_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: () async* {
        yield await Future.delayed(const Duration(seconds: 1));
      }(),
      initialData: false,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return const Responsive(
          mobile: MobileScreen(),
          tablet: TabletScreen(),
          desktop: DesktopScreen(),
        );
      },
    );
  }
}
