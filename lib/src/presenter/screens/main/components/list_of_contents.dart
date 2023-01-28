import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './content_card.dart';
import '../../../../config/theme.dart';
import '../../../responsive/responsive.dart';

class ListOfContents extends StatefulWidget {
  void Function() onMenuTap;
  // Press "Command + ." to insert code snippet.
  // final GlobalKey<ScaffoldState> homeScaffKey;
  ListOfContents({
    super.key,
    required this.onMenuTap,
  });

  @override
  State<ListOfContents> createState() => _ListOfContentsState();
}

class _ListOfContentsState extends State<ListOfContents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
        decoration: const BoxDecoration(
          color: kBgDarkColor,
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: kDefaultPadding,
                  right: kDefaultPadding,
                  top: kDefaultPadding / 2,
                ),
                child: Row(
                  children: [
                    if (!Responsive.isDesktop(context))
                      IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: widget.onMenuTap,
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
