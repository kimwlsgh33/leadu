import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './content_card.dart';
import '../../../../config/theme.dart';
import '../../../responsive/responsive.dart';
import '../../../components/side_menu.dart';

class ListOfContents extends StatefulWidget {
  // Press "Command + ." to insert code snippet.
  const ListOfContents({super.key});

  @override
  State<ListOfContents> createState() => _ListOfContentsState();
}

class _ListOfContentsState extends State<ListOfContents> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // drawer: 해당 Scaffold의 drawer를 열고 닫을 수 있는 버튼을 제공합니다.
      drawer: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 250),
        child: const SideMenu(),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
        decoration: const BoxDecoration(
          color: kBgDarkColor,
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Row(
                  children: [
                    if (!Responsive.isDesktop(context))
                      IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () {
                          _scaffoldKey.currentState!.openDrawer();
                        },
                      ),
                    if (!Responsive.isDesktop(context))
                      const SizedBox(width: 5),
                    Expanded(
                      child: TextField(
                        onChanged: (value) {},
                        decoration: const InputDecoration(
                          hintText: 'Search',
                          fillColor: kBgLightColor,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: Padding(
                            padding: EdgeInsets.all(kDefaultPadding * 0.75),
                            child: Icon(Icons.search),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const ContentCard(),
            ],
          ),
        ),
      ),
    );
  }
}
