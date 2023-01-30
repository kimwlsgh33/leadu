import 'package:flutter/material.dart';
import 'package:leadu/src/config/theme.dart';
import 'package:leadu/src/presenter/responsive/responsive.dart';
import 'package:websafe_svg/websafe_svg.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Row(
        children: [
          if (Responsive.isMobile(context)) const BackButton(),
          IconButton(
            onPressed: () {},
            icon: WebsafeSvg.asset(
              'assets/Icons/Trash.svg',
              width: 24,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: WebsafeSvg.asset(
              'assets/Icons/Reply.svg',
              width: 24,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: WebsafeSvg.asset(
              'assets/Icons/Reply all.svg',
              width: 24,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: WebsafeSvg.asset(
              'assets/Icons/Printer.svg',
              width: 24,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: WebsafeSvg.asset(
              'assets/Icons/Markup.svg',
              width: 24,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: WebsafeSvg.asset(
              'assets/Icons/More vertical.svg',
              width: 24,
            ),
          ),
        ],
      ),
    );
  }
}
