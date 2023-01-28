import 'package:flutter/material.dart';
import 'package:leadu/src/config/theme.dart';
import 'package:websafe_svg/websafe_svg.dart';

class Tags extends StatelessWidget {
  const Tags({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            WebsafeSvg.asset("assets/Icons/Angle down.svg", width: 16),
            const SizedBox(width: kDefaultPadding / 4),
            WebsafeSvg.asset("assets/Icons/Markup.svg", width: 20),
            const SizedBox(width: kDefaultPadding / 2),
            Text(
              "Tags",
              style: Theme.of(context)
                  .textTheme
                  .button!
                  .copyWith(color: kGrayColor),
            ),
            const Spacer(),
            MaterialButton(
              padding: const EdgeInsets.all(10),
              minWidth: 40,
              onPressed: () {},
              child: const Icon(
                Icons.add,
                color: kGrayColor,
                size: 20,
              ),
            ),
          ],
        )
      ],
    );
  }
}


