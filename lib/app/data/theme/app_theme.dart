import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kPrimaryColor = Color(0xff4d7fff);
const kPrimaryLightColor = Color(0xffd3eaff);
const primaryDarkColor = Color(0xff3681b3);
const secondaryColor = Color(0xffa6afff);
const secondaryLightColor = Color(0xffa6c5ff);
const secondaryDarkColor = Color(0xffa6cbff);
// const primaryTextColor = Color(0xFFF1E6FF);
// const secondaryTextColor = Color(0xFFF1E6FF);

ThemeData get appThemeData => ThemeData(
    primaryColor: kPrimaryColor,
    primaryColorLight: kPrimaryLightColor,
    scaffoldBackgroundColor: Colors.white,
    accentColor: kPrimaryColor,
    appBarTheme: appBarTheme,
    textTheme: GoogleFonts.poppinsTextTheme());

AppBarTheme get appBarTheme => AppBarTheme(
  brightness: Brightness.dark
);