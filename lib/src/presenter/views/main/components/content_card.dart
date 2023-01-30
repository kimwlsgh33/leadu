import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';
import '../../../../config/theme.dart';
import '../../../../base/extensions.dart';

class ContentCard extends StatelessWidget {
  final bool isActive;
  // final Content content;
  // final VoidCallback press;
  const ContentCard({
    super.key,
    this.isActive = true,
    // required this.content,
    // required this.press,
  });

  @override
  Widget build(BuildContext context) {
    var isChecked = false, isAttachmentAvailable = false;
    var tagColor = Colors.lightGreen;

    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: InkWell(
        onTap: () {
          showModalBottomSheet(context: context, builder: (context) => Container());
        },
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                color: isActive ? kPrimaryColor : kBgDarkColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 32,
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Icon(
                            Icons.book,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: kDefaultPadding / 2),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            text: 'Content Title \n',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: isActive ? Colors.white : kTextColor),
                            children: [
                              TextSpan(
                                text: 'Content Subtitle',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                      color: isActive
                                          ? Colors.white70
                                          : kTextColor,
                                    ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            'time',
                            style: TextStyle(
                              fontSize: 12,
                              color: isActive ? Colors.white70 : kTextColor,
                            ),
                          ),
                          const SizedBox(height: 5),
                          if (!isAttachmentAvailable)
                            WebsafeSvg.asset(
                              'assets/Icons/Paperclip.svg',
                              color: isActive ? Colors.white70 : kGrayColor,
                            )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: kDefaultPadding / 2),
                  Text(
                    'Content Body',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          height: 1.5,
                          color: isActive ? Colors.white70 : null,
                        ),
                  ),
                ],
              ),
            ).addNeumorphism(
              blurRadius: 15,
              borderRadius: 15,
              offset: const Offset(5, 5),
              topShadowColor: Colors.white60,
              bottomShadowColor: const Color(0xFF234395).withOpacity(0.15),
            ),
            if (!isChecked)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  height: 12,
                  width: 12,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: kBadgeColor,
                  ),
                ).addNeumorphism(
                  blurRadius: 4,
                  borderRadius: 8,
                  offset: const Offset(2, 2),
                ),
              ),
            if (tagColor != null)
              Positioned(
                top: 0,
                left: 8,
                child: WebsafeSvg.asset(
                  'assets/Icons/Markup filled.svg',
                  height: 18,
                  color: tagColor,
                ),
              )
          ],
        ),
      ),
    );
  }
}
