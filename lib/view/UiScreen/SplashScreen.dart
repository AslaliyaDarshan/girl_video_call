import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:girl_video_call/view/Constants/ConstantClass.dart';
import 'package:girl_video_call/view/UiScreen/FavouriteCountryGirl.dart';
import 'package:girl_video_call/view/UiScreen/PolicyScreen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: 100.h,
        width: 100.w,
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
                  Constants.gradientText("Flirt", 32.sp),
                ],
              ),
              height(3.h),
              Constants.text("Welcome", 27.sp, Colors.white),
              height(46.h),
              InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                        duration: const Duration(milliseconds: 1200),
                        type: PageTransitionType.rotate,
                        alignment: Alignment.center,
                        childCurrent: const SplashScreen(),
                        //child: const FavouriteCountryGirl(),
                        child: const PolicyScreen(),
                        inheritTheme: true,
                        ctx: context),
                  );
                },
                child: Container(
                  height: 60,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black,
                          offset: Offset(8, 8),
                          blurRadius: 15,
                          spreadRadius: 1),
                    ],
                    gradient: gradientColor,
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
