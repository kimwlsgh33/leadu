import 'package:flutter/material.dart';
import 'package:leadu/src/config/theme.dart';
import 'package:leadu/src/presenter/components/side_menu.dart';
import 'package:leadu/src/presenter/responsive/responsive.dart';
import 'package:leadu/src/presenter/views/contents/content_screen.dart';
import 'package:leadu/src/presenter/views/goals/goal_screen.dart';
import 'package:leadu/src/presenter/views/main/components/list_of_contents.dart';
import 'package:leadu/src/presenter/views/todos/today_screen.dart';
import 'package:leadu/src/presenter/views/todos/tomorrow_screen.dart';

class HomeNav extends StatefulWidget {
  const HomeNav({super.key});

  @override
  State<HomeNav> createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _page = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onPageChanged(index) {
    _pageController.jumpToPage(index);
    setState(() {
      _page = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const Drawer(
        child: SideMenu(),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: [
          const GoalScreen(),
          const TodayScreen(),
          const TomorrowScreen(),
          ListOfContents(
            onMenuTap: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
          if (Responsive.isDesktop(context)) const ContentScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        // padding: const EdgeInsets.only(top: 10),
        decoration: const BoxDecoration(
          color: kBgDarkColor,
        ),
        child: NavigationBar(
          backgroundColor: kBgDarkColor,
          onDestinationSelected: onPageChanged,
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home,
                  color: _page == 0 ? Colors.blue : Colors.grey),
              label: "",
            ),
            NavigationDestination(
              icon: Icon(Icons.view_list,
                  color: _page == 1 ? Colors.blue : Colors.grey),
              label: "",
            ),
            NavigationDestination(
              icon: Icon(Icons.edit_note,
                  color: _page == 2 ? Colors.blue : Colors.grey),
              label: "",
            ),
            NavigationDestination(
              icon: Icon(Icons.dataset,
                  color: _page == 3 ? Colors.blue : Colors.grey),
              label: "",
            ),
            if (Responsive.isDesktop(context))
              NavigationDestination(
                icon: Icon(Icons.question_mark_rounded,
                    color: _page == 4 ? Colors.blue : Colors.grey),
                label: "",
              ),
          ],
        ),
      ),
    );
  }
}
