import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//This block defines a function named appStyle that takes three parameters: size (a double representing font size), color (a Color object representing text color), and fw (a FontWeight representing font weight).
//
// Inside the function, it uses GoogleFonts.poppins to create a TextStyle object. The fontSize, color, and fontWeight properties are set using the provided parameters.
//
// Finally, the function returns the created TextStyle object.
//
// This function is designed to simplify the process of creating a TextStyle using the Google Fonts package, specifically the "Poppins" font. You can use this function to apply consistent text styling throughout your Flutter application. For example, you might use it like this:
TextStyle appStyle(double size, Color color, FontWeight fw) {
  return GoogleFonts.poppins(
    fontSize: size,
    color: color,
    fontWeight: fw,
  );
}
TextStyle appStyleHt(double size, Color color, FontWeight fw,double ht) {
  return GoogleFonts.poppins(
    fontSize: size,
    color: color,
    fontWeight: fw,
    height: ht,

  );
}
