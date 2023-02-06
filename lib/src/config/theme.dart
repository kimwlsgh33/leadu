import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//================================================
// Colors
//================================================
// All of our constant stuff
const kPrimaryColor = Color(0xFF366CF6);
const kSecondaryColor = Color(0xFFF5F6FC);
const kBgLightColor = Color(0xFFF2F4FC);
const kBgDarkColor = Color(0xFFEBEDFA);
const kBadgeColor = Color(0xFFEE376E);
const kGrayColor = Color(0xFF8793B2);
const kTitleTextColor = Color(0xFF30384D);
const kTextColor = Color(0xFF4D5875);
const kDefaultPadding = 20.0;
// instagram
const mobileBackgroundColor = Color.fromRGBO(0, 0, 0, 1);
const webBackgroundColor = Color.fromRGBO(18, 18, 18, 1);
const mobileSearchColor = Color.fromRGBO(38, 38, 38, 1);
const blueColor = Color.fromRGBO(0, 149, 246, 1);
const primaryColor = Colors.white;
const secondaryColor = Colors.grey;
// kakao
const kakaoBackgroundColor = Color(0xFF282A31);
const kakaoSecondaryColor = Color(0xFF31353F);
const kakaoWhite = Color(0xFFF7F7F7);
const kakaoYellow = Color(0xFFFFE300);
const kakaoDeepYellow = Color(0xFFF4DA00);
//================================================
// Theme
//================================================
final msLightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: const Color(0xFFFAF9F8),
  textTheme: GoogleFonts.nanumGothicTextTheme(),
  splashColor: Colors.amber,
  focusColor: Colors.amber,
  colorScheme: const ColorScheme.light().copyWith(
    primary: kPrimaryColor,
    background: const Color(0xFFFAF9F8),
    secondary: Colors.grey,
    onPrimary: Colors.white,
  ),
);
final msDarkTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: const Color.fromRGBO(18, 18, 18, 1),
);
