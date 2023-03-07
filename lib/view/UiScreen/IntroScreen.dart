import 'package:flutter/material.dart';
import 'package:girl_video_call/view/ConstantClass.dart';
import 'package:intro_screen_onboarding_flutter/intro_app.dart';
import 'package:sizer/sizer.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Constants.text("""
             Find your
  preferences partners.""", 23.sp, Colors.white),
          height(8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {},
                child: Container(
                  height: 7.5.h,
                  width: 45.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: gradientButton,
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
                      "Skip",
                      21.sp,
                      const Color(0xFFae198a),
                    ),
                  ),
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  height: 7.5.h,
                  width: 45.w,
                  decoration: BoxDecoration(
                    gradient: gradientButton,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Constants.text(
                    "Next",
                    21.sp,
                    Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
} /*Match with your partner*/
/* IntroScreenOnboarding(
        backgroudColor: backgroundColor,
        foregroundColor: Color(0xfff632c6),
        introductionList: [
          Introduction(
            imageUrl: "assets/image/intro1.jpg",
            title: "Find Your \nSpecial Someone",
            subTitle: "The huge base of users",
            titleTextStyle: TextStyle(
                color: Colors.white.withOpacity(0.9), fontSize: 22.sp),
            subTitleTextStyle: TextStyle(
                color: Colors.white.withOpacity(0.9), fontSize: 15.sp),
          ),
          Introduction(
            imageUrl: "assets/image/intro1.jpg",
            title: "More Profiles\n More Date",
            subTitle: "Choose a prefreable browsing model",
            titleTextStyle: TextStyle(
                color: Colors.white.withOpacity(0.9), fontSize: 22.sp),
            subTitleTextStyle: TextStyle(
                color: Colors.white.withOpacity(0.9), fontSize: 15.sp),
          ),
          Introduction(
            imageUrl: "assets/image/intro1.jpg",
            title: "Interact Around\n The World",
            subTitle: "See who like you",
            titleTextStyle: TextStyle(
                color: Colors.white.withOpacity(0.9), fontSize: 22.sp),
            subTitleTextStyle: TextStyle(
                color: Colors.white.withOpacity(0.9), fontSize: 15.sp),
          ),
        ],
      )*/
