import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static TextStyle heading1 = GoogleFonts.openSans(
      fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white);
  static TextStyle heading2 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 30,
    color: Colors.indigo,
  );
  static TextStyle heading3 = GoogleFonts.robotoSlab(
    fontWeight: FontWeight.bold,
    fontSize: 35,
    color: Colors.indigo,
  );
  static TextStyle heading4 = GoogleFonts.robotoSlab(
    fontWeight: FontWeight.bold,
    fontSize: 35,
    color: Colors.black,
  );
  static TextStyle title = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontSize: 20,
  );
  static TextStyle subTitle = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 18,
      color: Colors.black);
  static TextStyle paragraph = GoogleFonts.mukta(
    fontWeight: FontWeight.w400,
    fontSize: 17,
  );

  static TextStyle paragraph1 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: Colors.white
  );
  static TextStyle paragraph2 = GoogleFonts.mukta(
    fontWeight: FontWeight.w400,
    fontSize: 20,
  );
}
