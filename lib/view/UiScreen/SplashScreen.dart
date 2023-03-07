import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girl_video_call/view/ConstantClass.dart';
import 'package:girl_video_call/view/UiScreen/PolicyScreen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/splashBg.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/image/lips.png",
                      height: 18.h, width: 18.h, fit: BoxFit.contain),
                  Constants.gradientText("Flirt", 60),
                ],
              ),
              height(3.h),
              Constants.text("Welcome", 30.sp, Colors.white),
              height(45.h),
              InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                        duration: const Duration(milliseconds: 1300),
                        curve: Curves.slowMiddle,
                        type: PageTransitionType.fade,
                        alignment: Alignment.center,
                        child: const PolicyScreen(),
                        inheritTheme: true,
                        ctx: context),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  alignment: Alignment.center,
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black,
                          offset: Offset(8, 8),
                          blurRadius: 15,
                          spreadRadius: 1),
                    ],
                    gradient: gradientButton,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Constants.text("Join Now", 21.sp, Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
