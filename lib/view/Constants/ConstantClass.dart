import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

Color backgroundColor = const Color(0xFF1F0417);
Color policyBackgroundColor = const Color(0xFF45303f);
LinearGradient gradientColor = const LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Color(0xFFe31db6),
    Color(0xFF52bafa),
  ],
);
LinearGradient gradientWhite = const LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Color(0xFFFFFFFF),
    Color(0xFFFFFFFF),
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
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: pDblFontSize, color: pClr, fontWeight: FontWeight.w500),
    );
  }

  static skipButton(
    void Function() onTap,
    String pStrText, {
    double? pDblHeight,
    double? pDblWidth,
    int? pIntClr,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: onTap,
      child: Container(
        height: pDblHeight ?? 7.5.h,
        width: pDblWidth ?? 45.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: gradientColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          margin: const EdgeInsets.all(3),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Constants.text(
            pStrText,
            21.sp,
            Color(pIntClr ?? 0xFFae198a),
          ),
        ),
      ),
    );
  }

  static confirmButton(
    void Function() onTap,
    String pStrText,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: gradientColor,
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

  static nextButton(void Function() onTap, String pStrText) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 7.5.h,
        width: 45.w,
        decoration: BoxDecoration(
          gradient: gradientColor,
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

  static warningDialog(String pStrTitle, String pStrWarningText,
      {void Function()? onTap, void Function()? onTaps}) {
    Get.defaultDialog(
      barrierDismissible: false,
      title: pStrTitle,
      titleStyle: TextStyle(color: backgroundColor.withOpacity(0.8)),
      content: text(pStrWarningText, 12.sp, backgroundColor.withOpacity(0.8)),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [button("Cancel"), button("Ok")],
          ),
        ),
      ],
    );
  }

  static button(String pStrText) {
    return InkWell(
      onTap: () {
        Get.back();
      },
      child: Container(
        height: 5.h,
        width: 20.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor.withOpacity(0.75),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(pStrText,
            style: TextStyle(color: Colors.white, fontSize: 12.sp)),
      ),
    );
  }

  static snackBar(String pStrTitle, String pStrMsg) {
    return Get.snackbar(
      pStrTitle,
      pStrMsg,
      colorText: Colors.white,
      barBlur: 25,
      margin: const EdgeInsets.only(bottom: 50),
      animationDuration: const Duration(seconds: 3),
      snackPosition: SnackPosition.BOTTOM,
      icon: Icon(Icons.add_alert, color: Colors.white.withOpacity(0.9)),
    );
  }
}
