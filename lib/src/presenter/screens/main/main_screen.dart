import 'package:flutter/material.dart';
import 'package:leadu/src/presenter/components/side_menu.dart';
import 'package:leadu/src/presenter/responsive/responsive.dart';
import 'package:leadu/src/presenter/screens/contents/content_screen.dart';
import 'package:leadu/src/presenter/screens/main/components/list_of_contents.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  // final _future = Supabase.instance.client
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        mobile: ListOfContents(),
        tablet: Row(
          children: [
            Expanded(
              flex: 6,
              child: ListOfContents(),
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
              flex: _size.width > 1340 ? 2 : 4,
              child: SideMenu(),
            ),
            Expanded(
              flex: _size.width > 1340 ? 3 : 5,
              child: ListOfContents(),
            ),
            Expanded(
              flex: _size.width > 1340 ? 8 : 10,
              child: ContentScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
