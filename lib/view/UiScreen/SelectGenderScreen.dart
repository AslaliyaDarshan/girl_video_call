import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girl_video_call/controller/HomeController.dart';
import 'package:girl_video_call/view/Constants/ConstantClass.dart';
import 'package:girl_video_call/view/UiScreen/AddNameScreen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';

class SelectGenderScreen extends StatefulWidget {
  const SelectGenderScreen({Key? key}) : super(key: key);

  @override
  State<SelectGenderScreen> createState() => _SelectGenderScreenState();
}

class _SelectGenderScreenState extends State<SelectGenderScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Container(
            height: 22.h,
            width: 100.w,
            margin: EdgeInsets.symmetric(vertical: 7.h),
            color: Colors.white.withOpacity(0.5),
          ),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    controller.man.value = true;
                    controller.woMan.value = false;
                  },
                  child: Container(
                    height: 30.h,
                    width: 43.w,
                    margin: const EdgeInsets.all(7),
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      gradient:
                          controller.man.value ? gradientButton : gradientWhite,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset("assets/image/man.png"),
                    ),
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    controller.woMan.value = true;
                    controller.man.value = false;
                    setState(() {});
                  },
                  child: Container(
                    height: 30.h,
                    width: 43.w,
                    margin: const EdgeInsets.all(7),
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      gradient: controller.woMan.value
                          ? gradientButton
                          : gradientWhite,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset("assets/image/women.png"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          height(10.h),
          Constants.confirmButton(() {
            if (controller.man.value == true ||
                controller.woMan.value == true) {
              Navigator.push(
                context,
                PageTransition(
                    duration: const Duration(milliseconds: 1300),
                    type: PageTransitionType.topToBottomJoined,
                    childCurrent: const SelectGenderScreen(),
                    child: const AddNameScreen(),
                    inheritTheme: true,
                    ctx: context),
              );
            } else {
              Constants.warningDialog(
                  "Select Gender", "Please select any gender...");
            }
          }, "Continue")
        ],
      ),
    );
  }
}
