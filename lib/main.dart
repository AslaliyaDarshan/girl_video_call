import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girl_video_call/view/UiScreen/IntroScreen.dart';
import 'package:girl_video_call/view/UiScreen/IntroScreen1.dart';
import 'package:girl_video_call/view/UiScreen/PolicyScreen.dart';
import 'package:girl_video_call/view/UiScreen/SplashScreen.dart';
import 'package:sizer/sizer.dart';
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
            "/IntroScreen1": (context) => const IntroScreen1(),
          },
        );
      },
    ),
  );
}
