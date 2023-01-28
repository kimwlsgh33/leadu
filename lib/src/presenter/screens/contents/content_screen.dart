import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';
import '../../../config/theme.dart';
import './components/header.dart';

class ContentScreen extends StatelessWidget {
  const ContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Header(),
              const Divider(
                thickness: 1,
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        maxRadius: 24,
                        backgroundImage: NetworkImage(
                          "https://picsum.photos/200",
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                      const SizedBox(width: kDefaultPadding),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          text: '이름',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge,
                                          children: [
                                            TextSpan(
                                              text:
                                                  " <jinho971031@gmail.com> to Jerry Torp",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            )
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "Inspiration for the day",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(width: kDefaultPadding / 2),
                                Text(
                                  "10:30 AM",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                            const SizedBox(height: kDefaultPadding),
                            LayoutBuilder(
                              builder: (context, constraints) => SizedBox(
                                width: constraints.maxWidth > 850
                                    ? 800
                                    : constraints.maxWidth,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Hello my friend, \n \nSunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
                                      style: TextStyle(
                                        fontSize: 16,
                                        height: 1.5,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    const SizedBox(height: kDefaultPadding),
                                    Row(
                                      children: [
                                        const Text(
                                          '6 Attachments',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        const Spacer(),
                                        Text(
                                          'Download All',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                        const SizedBox(width: kDefaultPadding / 4),
                                        WebsafeSvg.asset(
                                          'assets/Icons/Download.svg',
                                          height: 16,
                                          color: kGrayColor,
                                        ),
                                      ],
                                    ),
                                    const Divider(thickness: 1),
                                    const SizedBox(height: kDefaultPadding / 2),
                                    SizedBox(
                                      height: 200,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          "assets/images/Img_1.png",
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
