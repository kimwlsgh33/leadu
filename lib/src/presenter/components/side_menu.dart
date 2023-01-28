import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:leadu/src/presenter/components/side_menu_item.dart';
import 'package:leadu/src/presenter/components/tags.dart';
import 'package:websafe_svg/websafe_svg.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
import '../../config/theme.dart';
import '../responsive/responsive.dart';
import '../../base/extensions.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  // late User? user;

  // void _signInWithGoogle() async {
  //   final user = await Supabase.instance.client.auth.signInWithOAuth(
  //     Provider.google,
  //     redirectTo: "http://localhost:3000",
  //   );
  //
  //   if (!user) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text('Sign in failed'),
  //       ),
  //     );
  //     return;
  //   }
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     const SnackBar(
  //       content: Text("Signed in successfully"),
  //     ),
  //   );
  // }

  @override
  void initState() {
    super.initState();
    // user = Supabase.instance.client.auth.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
      height: double.infinity,
      color: kBgLightColor,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.logo_dev),
                    onPressed: () {},
                  ),
                  const Spacer(),
                  if (!Responsive.isDesktop(context)) const CloseButton(),
                ],
              ),
              const SizedBox(height: kDefaultPadding),
              TextButton.icon(
                onPressed: () {},
                icon: WebsafeSvg.asset(
                  "assets/Icons/Edit.svg",
                  width: 18,
                ),
                label: const Text(
                  "New Project",
                ),
                style: TextButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width, 0),
                  foregroundColor: Colors.white,
                  backgroundColor: kPrimaryColor,
                  padding: const EdgeInsets.symmetric(
                    vertical: kDefaultPadding,
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ).addNeumorphism(
                topShadowColor: Colors.white,
                bottomShadowColor: const Color(0xFF234395).withOpacity(0.2),
              ),
              const SizedBox(height: kDefaultPadding),
              TextButton.icon(
                onPressed: () {},
                icon: WebsafeSvg.asset(
                  "assets/Icons/Download.svg",
                  width: 18,
                ),
                label: const Text(
                  "New Project",
                ),
                style: TextButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width, 0),
                  foregroundColor: kTextColor,
                  backgroundColor: kBgDarkColor,
                  padding: const EdgeInsets.symmetric(
                    vertical: kDefaultPadding,
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ).addNeumorphism(),
              const SizedBox(height: kDefaultPadding * 2),
              SideMenuItem(
                press: () {},
                title: "Inbox",
                iconSrc: "assets/Icons/Inbox.svg",
                isActive: true,
                itemCount: 3,
              ),
              const SizedBox(height: kDefaultPadding * 2),
              Tags(),
              // TextButton(
              //   onPressed: _signInWithGoogle,
              //   child: const Text('Sign in with Google'),
              // ),
              // const Spacer(),
              // user != null
              //     ? Column(
              //         children: [
              //           Text(user!.email as String),
              //           TextButton(
              //             onPressed: () async {
              //               await Supabase.instance.client.auth.signOut();
              //               setState(() {});
              //             },
              //             child: const Text('Sign out'),
              //           ),
              //         ],
              //       )
              //     : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
