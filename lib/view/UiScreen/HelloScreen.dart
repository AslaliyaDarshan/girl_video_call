import 'package:flutter/material.dart';
import 'package:girl_video_call/view/Constants/ConstantClass.dart';
import 'package:girl_video_call/view/UiScreen/BestPhotoScreen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';

class HelloScreen extends StatefulWidget {
  const HelloScreen({Key? key}) : super(key: key);

  @override
  State<HelloScreen> createState() => _HelloScreenState();
}

class _HelloScreenState extends State<HelloScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(  resizeToAvoidBottomInset: false,
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
                "assets/image/hello.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
          Constants.gradientText("It's a match", 30.sp),
          Constants.text(
              "Don't keep her waiting say hello now ", 15.sp, Colors.white),
          height(4.h),
          Constants.skipButton(() {
            Navigator.push(
              context,
              PageTransition(
                  duration: const Duration(milliseconds: 1300),
                  type: PageTransitionType.topToBottomJoined,
                  childCurrent: const HelloScreen(),
                  child: const BestPhotoScreen(),
                  inheritTheme: true,
                  ctx: context),
            );
          }, "Keep swiping",
              pDblHeight: 7.5.h, pDblWidth: 93.w, pIntClr: 0xFFFFFFFF)
        ],
      ),
    );
  }
}
