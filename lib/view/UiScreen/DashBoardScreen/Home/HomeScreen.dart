import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girl_video_call/controller/HomeController.dart';
import 'package:girl_video_call/model/ModelClass.dart';
import 'package:girl_video_call/view/Constants/ConstantClass.dart';
import 'package:girl_video_call/view/UiScreen/DashBoardScreen/Home/VideoScreen.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());

  ValueNotifier loading = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 100.h,
            width: 100.w,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/image/bg.gif"),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Constants.gradientText("Latest Videos", 20.sp),
                  ),
                  Expanded(
                    flex: 1,
                    child: GridView.builder(
                      itemCount: controller.dataList.length,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 33.h,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(
                              () {
                                loading.value = true;
                                Timer(
                                  const Duration(seconds: 5),
                                  () {
                                    loading.value = false;

                                    controller.modelClass = ModelClass(
                                        image: controller.dataList[index].image,
                                        video:
                                            controller.dataList[index].video);
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                          duration: const Duration(
                                              milliseconds: 1300),
                                          type: PageTransitionType.scale,
                                          alignment: Alignment.center,
                                          childCurrent: const HomeScreen(),
                                          child: const VideoScreen(),
                                          inheritTheme: true,
                                          ctx: context),
                                    );
                                  },
                                );
                              },
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: SizedBox(
                              height: 32.h,
                              width: double.infinity,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                ),
                                child: Image.asset(
                                  "${controller.dataList[index].image}",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          loading.value == true
              ? Lottie.asset("assets/lottie/I6zlfRF5lh.json",
                  height: 150, width: 150, fit: BoxFit.cover)
              : const SizedBox(),
        ],
      ),
    );
  }
}
