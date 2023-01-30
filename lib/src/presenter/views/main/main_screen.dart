import 'package:flutter/material.dart';
import 'package:leadu/src/presenter/views/contents/content_screen.dart';
import '../../components/side_menu.dart';
import '../../responsive/responsive.dart';
import '../../../config/navs/home_nav.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  // final _future = Supabase.instance.client
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        mobile: const HomeNav(),
        tablet: Row(
          children: const [
            Expanded(
              flex: 6,
              child: HomeNav(),
            ),
            Expanded(
              flex: 9,
              child: ContentScreen(),
            ),
          ],
        ),
        desktop: Row(
          children: [
            Expanded(
              flex: size.width > 1340 ? 2 : 4,
              child: const SideMenu(),
            ),
            Expanded(
              flex: size.width > 1340 ? 3 : 5,
              child: const HomeNav(),
            ),
            Expanded(
              flex: size.width > 1340 ? 8 : 10,
              child: const ContentScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
