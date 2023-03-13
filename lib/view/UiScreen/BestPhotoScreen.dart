import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girl_video_call/controller/HomeController.dart';
import 'package:girl_video_call/view/Constants/ConstantClass.dart';
import 'package:girl_video_call/view/UiScreen/InterestScreen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BestPhotoScreen extends StatefulWidget {
  const BestPhotoScreen({Key? key}) : super(key: key);

  @override
  State<BestPhotoScreen> createState() => _BestPhotoScreenState();
}

class _BestPhotoScreenState extends State<BestPhotoScreen> {
  HomeController controller = Get.put(HomeController());
  File file = File("");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: 100.h,
            width: 100.w,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  height(4.h),
                  Constants.text(
                    "Add your best photos",
                    23.sp,
                    Colors.white.withOpacity(0.9),
                  ),
                  height(2.h),
                  Constants.text(
                    "Add your best photos to get a higher matches",
                    16.5.sp,
                    Colors.white.withOpacity(0.9),
                  ),
                  Container(
                    height: 20.h,
                    width: 100.w,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    color: Colors.white.withOpacity(0.5),
                  ),
                  Wrap(
                    children: List.generate(
                      controller.bestImageList.length,
                      (index) {
                        return Container(
                          height: 34.h,
                          width: 45.w,
                          margin: const EdgeInsets.all(7),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(file, fit: BoxFit.fill),
                          ),
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        pickImage();
                      },
                      child: Container(
                        height: 32.h,
                        width: 45.w,
                        margin: const EdgeInsets.all(7),
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          gradient: gradientColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: backgroundColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.add,
                            size: 60,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Constants.confirmButton(() {
            Navigator.push(
              context,
              PageTransition(
                  duration: const Duration(milliseconds: 1300),
                  type: PageTransitionType.bottomToTopJoined,
                  childCurrent: const BestPhotoScreen(),
                  child: const InterestScreen(),
                  inheritTheme: true,
                  ctx: context),
            );
          }, "Continue"),
        ],
      ),
    );
  }

  pickImage() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: Colors.white.withOpacity(0.9),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              text(() async {
                ImagePicker img = ImagePicker();
                XFile? f2 = await img.pickImage(source: ImageSource.camera);

                try {
                  file = File(f2!.path);
                  controller.bestImageList.add(file.path);
                } catch (e) {
                  print("Darshan$e");
                }

                Navigator.pop(context);
              }, "Take Photo"),
              text(() async {
                ImagePicker img = ImagePicker();
                XFile? f2 = await img.pickImage(source: ImageSource.gallery);
                try {
                  file = File(f2!.path);
                  controller.bestImageList.add(file.path);
                  setState(() {});
                } catch (e) {
                  print("Darshan$e");
                }
                Navigator.pop(context);
              }, "Choose From Library"),
              text(() {
                Navigator.pop(context);
              }, "Cancel"),
            ],
          ),
        );
      },
    );
  }

  text(void Function() onTap, String pStrText) {
    return InkWell(
      onTap: onTap,
      child: Text(
        pStrText,
        style: TextStyle(
            color: backgroundColor.withOpacity(0.7),
            fontSize: 14.sp,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
