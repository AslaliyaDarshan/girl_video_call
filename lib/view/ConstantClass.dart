import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:sizer/sizer.dart';

Color backgroundColor = const Color(0xFF1F0417);
Color policyBackgroundColor = const Color(0xFF321a2b);
LinearGradient gradientButton = const LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Color(0xFFe31db6),
    Color(0xFF52bafa),
  ],
);

Widget height(double height) {
  return SizedBox(
    height: height,
  );
}

Widget width(double width) {
  return SizedBox(
    width: width,
  );
}

class Constants {
  static gradientText(String pStrText, double pDblFontSize) {
    return GradientText(
      pStrText,
      style: GoogleFonts.amita(fontSize: pDblFontSize),
      colors: const [
        Color(0xFF53b8fa),
        Color(0xFFd729bb),
      ],
    );
  }

  static text(
    String pStrText,
    double pDblFontSize,
    Color pClr,
  ) {
    return Text(
      pStrText,
      style: TextStyle(
          fontSize: pDblFontSize, color: pClr, fontWeight: FontWeight.w500),
    );
  }

  static confirmButton(
    void Function() onTap,
    String pStrText,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        alignment: Alignment.center,
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: gradientButton,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Constants.text(
          pStrText,
          21.sp,
          Colors.white,
        ),
      ),
    );
  }
}
