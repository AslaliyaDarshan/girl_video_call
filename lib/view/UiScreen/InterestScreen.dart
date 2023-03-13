import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girl_video_call/controller/HomeController.dart';
import 'package:girl_video_call/view/Constants/ConstantClass.dart';
import 'package:girl_video_call/view/UiScreen/SelectGenderScreen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InterestScreen extends StatefulWidget {
  const InterestScreen({Key? key}) : super(key: key);

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                height(4.h),
                Constants.text(
                  "Select your interest",
                  23.sp,
                  Colors.white.withOpacity(0.9),
                ),
                height(3.h),
                Constants.text(
                  "Select your interests to match with soul mate who have similar things in common.",
                  16.5.sp,
                  Colors.white.withOpacity(0.9),
                ),
                Container(
                  height: 20.h,
                  width: 100.w,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  color: Colors.white.withOpacity(0.5),
                ),
                button("Gaming", 1, "Dancing", 2),
                button("Singing", 3, "Reading", 4),
                button("Movie", 5, "FootBall", 6),
                button("Painting", 7, "Fashion", 8),
                button("Writing", 9, "Novel", 10),
                button("Art", 11, "Travel", 12),
                button("Cricket", 13, "Eating", 14),
                height(5.h),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 4.h),
            child: Constants.confirmButton(() {
              Navigator.push(
                context,
                PageTransition(
                    duration: const Duration(milliseconds: 1300),
                    type: PageTransitionType.topToBottomJoined,
                    childCurrent: const InterestScreen(),
                    child: const SelectGenderScreen(),
                    inheritTheme: true,
                    ctx: context),
              );
            }, "Continue"),
          ),
        ],
      ),
    );
  }

  button(
    String pStrText,
    int pIntIndex,
    String pStrText1,
    int pIntIndex1,
  ) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                controller.select.value = pIntIndex;
              },
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 8.5.h,
                width: 43.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: gradientColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  margin: const EdgeInsets.all(2.5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: controller.select.value == pIntIndex
                        ? policyBackgroundColor
                        : backgroundColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Constants.text(
                    pStrText,
                    18.5.sp,
                    Colors.white70,
                  ),
                ),
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                controller.select.value = pIntIndex1;
                setState(() {});
              },
              child: Container(
                height: 8.5.h,
                width: 43.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: gradientColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  margin: const EdgeInsets.all(2.5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: controller.select.value == pIntIndex1
                        ? policyBackgroundColor
                        : backgroundColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Constants.text(
                    pStrText1,
                    18.5.sp,
                    Colors.white70,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
