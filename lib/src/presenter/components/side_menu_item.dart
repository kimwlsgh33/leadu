import 'package:flutter/material.dart';
import 'package:leadu/src/presenter/components/counter_badge.dart';
import 'package:websafe_svg/websafe_svg.dart';
import '../../config/theme.dart';

class SideMenuItem extends StatelessWidget {
  final bool isActive, isHover, showBorder;
  final int itemCount;
  final String iconSrc, title;
  final VoidCallback press;

  SideMenuItem({
    super.key,
    required this.isActive,
    this.isHover = false,
    this.showBorder = true,
    required this.itemCount,
    required this.iconSrc,
    required this.title,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: InkWell(
        onTap: press,
        child: Row(
          children: [
            (isActive || isHover)
                ? Container(
                    width: 3,
                    height: 72,
                    color: kPrimaryColor,
                  )
                : const SizedBox(width: 15),
            const SizedBox(width: kDefaultPadding),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                  bottom: 15,
                  right: 5,
                ),
                decoration: showBorder
                    ? const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xFFDFE2EF),
                          ),
                        ),
                      )
                    : null,
                child: Row(
                  children: [
                    WebsafeSvg.asset(iconSrc,
                        height: 20,
                        color:
                            isActive || isHover ? kPrimaryColor : kGrayColor),
                    const SizedBox(width: kDefaultPadding * 0.75),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.button!.copyWith(
                            color:
                                (isActive || isHover) ? kTextColor : kGrayColor,
                          ),
                    ),
                    const Spacer(),
                    if (itemCount != null) CounterBadge(count: itemCount),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
