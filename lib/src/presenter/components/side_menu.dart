import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
import '../../config/theme.dart';
import '../responsive/responsive.dart';

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
      decoration: const BoxDecoration(color: kBgLightColor),
      child: SafeArea(
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
    );
  }
}
