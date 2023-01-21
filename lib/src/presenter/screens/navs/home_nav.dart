import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leadu/src/config/theme.dart';
import 'package:leadu/src/presenter/screens/contents/content_screen.dart';
import 'package:leadu/src/presenter/screens/main/components/list_of_contents.dart';
import 'package:leadu/src/presenter/screens/quests/quest_screen.dart';

class HomeNav extends StatefulWidget {
  const HomeNav({super.key});

  @override
  State<HomeNav> createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
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
      body: PageView(
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: [
          ListOfContents(),
          QuestScreen(),
          ContentScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: 10),
        decoration: const BoxDecoration(
          color: kBgDarkColor,
        ),
        child: CupertinoTabBar(
          backgroundColor: kBgDarkColor,
          border: const Border(),
          onTap: onPageChanged,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home,
                  color: _page == 0 ? Colors.blue : Colors.grey),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dataset,
                  color: _page == 1 ? Colors.blue : Colors.grey),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.question_mark_rounded,
                  color: _page == 2 ? Colors.blue : Colors.grey),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}
