import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girl_video_call/controller/HomeController.dart';
import 'package:girl_video_call/view/Constants/ConstantClass.dart';
import 'package:girl_video_call/view/UiScreen/DashBoardScreen/DashBoardScreen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FavouriteCountryGirl extends StatefulWidget {
  const FavouriteCountryGirl({Key? key}) : super(key: key);

  @override
  State<FavouriteCountryGirl> createState() => _FavouriteCountryGirlState();
}

class _FavouriteCountryGirlState extends State<FavouriteCountryGirl> {
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    controller.select1.value = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                height(4.h),
                Constants.text(
                  "Select your favourite country girl",
                  18.sp,
                  Colors.white.withOpacity(0.9),
                ),
                Container(
                  height: 20.h,
                  width: 100.w,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  color: Colors.white.withOpacity(0.5),
                ),
                image(1, "assets/image/indian.jpg", "Indian Girls", 2,
                    "assets/image/rasian.jpg", "Russian Girls"),
                image(3, "assets/image/pakistani.jpg", "Pakistani Girls", 4,
                    "assets/image/thailand.jpg", "Thailand Girls"),
                image(5, "assets/image/maliasian.jpg", "Malaysian Girls", 6,
                    "assets/image/korean.jpg", "Korean Girls"),
                image(7, "assets/image/turki.jpg", "Turkish Girls", 8,
                    "assets/image/usa.jpg", "USA Girls"),
                image(9, "assets/image/ukrain.jpg", "Ukraine Girls", 10,
                    "assets/image/newzealand.jpg", "New Zealand Girls"),
                height(8.h)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 2.5.h),
            child: Constants.confirmButton(() {
              Navigator.push(
                context,
                PageTransition(
                    duration: const Duration(milliseconds: 1300),
                    type: PageTransitionType.fade,
                    alignment: Alignment.center,
                    childCurrent: const FavouriteCountryGirl(),
                    //child: const FavouriteCountryGirl(),
                    child: const DashBoardScreen(),
                    inheritTheme: true,
                    ctx: context),
              );
              // Get.toNamed("/DashBoardScreen");
            }, "Confirm"),
          )
        ],
      ),
    );
  }

  image(
    int pIntIndex,
    String pStrUrl,
    String pStrCountry,
    int pIntIndex1,
    String pStrUrl1,
    String pStrCountry1,
  ) {
    return Column(
      children: [
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                splashColor: backgroundColor,
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  setState(() {
                    controller.select1.value = pIntIndex;
                  });
                },
                child: Container(
                  height: 30.h,
                  width: 43.w,
                  margin: const EdgeInsets.all(7),
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    gradient: controller.select1.value == pIntIndex
                        ? gradientColor
                        : null,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(pStrUrl, fit: BoxFit.cover),
                  ),
                ),
              ),
              InkWell(
                splashColor: backgroundColor,
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  setState(() {
                    controller.select1.value = pIntIndex1;
                  });
                },
                child: Container(
                  height: 30.h,
                  width: 43.w,
                  margin: const EdgeInsets.all(7),
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    gradient: controller.select1.value == pIntIndex1
                        ? gradientColor
                        : null,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(pStrUrl1, fit: BoxFit.cover),
                  ),
                ),
              ),
            ],
          ),
        ),
        Transform.translate(
          offset: const Offset(0, -10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Constants.gradientText(pStrCountry, 17.px),
              Constants.gradientText(pStrCountry1, 17.px),
            ],
          ),
        )
      ],
    );
  }
}
