import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girl_video_call/view/UiScreen/IntroScreen.dart';
import 'package:girl_video_call/view/UiScreen/PolicyScreen.dart';
import 'package:girl_video_call/view/UiScreen/SplashScreen.dart';
import 'package:sizer/sizer.dart';

height(double height, BuildContext context) {
  height = MediaQuery.of(context).size.height;
}

width(double width, BuildContext context) {
  width = MediaQuery.of(context).size.width;
}

void main() {
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            "/": (context) => const SplashScreen(),
            "/PolicyScreen": (context) => const PolicyScreen(),
            "/IntroScreen": (context) => const IntroScreen(),
          },
        );
      },
    ),
  );
}
