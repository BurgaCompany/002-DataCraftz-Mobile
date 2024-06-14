import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String tittleApp = "TransGo";

Color primaryColor = const Color(0xFF1F64E5);
Color lightColor = const Color(0xFFF6F8FB);
Color greyColor = const Color(0xFF6F6F6F);
Color whiteColor = const Color(0xFFFFFFFF);
Color redColor = const Color(0xFFF86E6E);
Color orangeColor = const Color(0xFFFFA800);
Color blackColor = const Color(0xFF000000);

TextStyle primaryTextStyle = GoogleFonts.poppins(
  color: primaryColor,
);
TextStyle blackTextStyle = GoogleFonts.poppins(
  color: blackColor,
);

TextStyle whiteTextStyle = GoogleFonts.poppins(
  color: whiteColor,
);

TextStyle greyTextStyle = GoogleFonts.poppins(
  color: greyColor,
);

TextStyle redTextStyle = GoogleFonts.poppins(
  color: redColor,
);

TextStyle orangeTextStyle = GoogleFonts.poppins(
  color: orangeColor,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;

class DevicesSettings {
  static double getHeigth(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getTextSize(BuildContext context) {
    return MediaQuery.textScalerOf(context).scale(1);
  }
}
