import 'package:flutter/material.dart';
import 'package:girl_video_call/view/Constants/ConstantClass.dart';
import 'package:girl_video_call/view/UiScreen/HelloScreen.dart';
import 'package:girl_video_call/view/UiScreen/IntroScreen1.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 60.h,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "assets/image/intro1.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
          height(4.h),
          Constants.text(
              "Find your preferences partners.", 23.sp, Colors.white),
          height(8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Constants.skipButton(() {
                Navigator.push(
                  context,
                  PageTransition(
                      duration: const Duration(milliseconds: 1000),
                      type: PageTransitionType.rightToLeftJoined,
                      childCurrent: const IntroScreen(),
                      child: const HelloScreen(),
                      inheritTheme: true,
                      ctx: context),
                );
              }, "Skip"),
              Constants.nextButton(() {
                Navigator.push(
                  context,
                  PageTransition(
                      duration: const Duration(milliseconds: 1000),
                      type: PageTransitionType.rightToLeftJoined,
                      childCurrent: const IntroScreen(),
                      child: const IntroScreen1(),
                      inheritTheme: true,
                      ctx: context),
                );
              }, "Next")
            ],
          ),
        ],
      ),
    );
  }
}
