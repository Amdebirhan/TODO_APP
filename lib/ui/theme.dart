import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const Color bluishClr = Color(0xff4e5ae8);
const Color yellowClr = Color(0xFFFFB746);
const Color pinkClr = Color(0xffff4667);
const Color whiteClr = Color(0xffffffff);
const Color darkGrayClr = Color(0xff121212);
const Color darkHeaderClr = Color(0xff424242);
const Color creameClr = Color(0xff424242);
const Color grayClr = Colors.grey;
const primaryClr = bluishClr;

class Themes {
  static final light = ThemeData(
      backgroundColor: Colors.white,
      primaryColor: primaryClr,
      brightness: Brightness.light);
  static final dark = ThemeData(
      backgroundColor: darkGrayClr,
      primaryColor: darkGrayClr,
      brightness: Brightness.dark);
}

TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode ? darkGrayClr : grayClr));
}

TextStyle get headingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold));
}

TextStyle get titleStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Get.isDarkMode ? darkGrayClr : grayClr));
}

TextStyle get subTitleStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Get.isDarkMode ? darkGrayClr : grayClr));
}
