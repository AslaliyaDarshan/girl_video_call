import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girl_video_call/controller/HomeController.dart';
import 'package:girl_video_call/view/Constants/ConstantClass.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class AddNameScreen extends StatefulWidget {
  const AddNameScreen({Key? key}) : super(key: key);

  @override
  State<AddNameScreen> createState() => _AddNameScreenState();
}

class _AddNameScreenState extends State<AddNameScreen> {
  TextEditingController txtNameController = TextEditingController();
  TextEditingController txtEmailController = TextEditingController();
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 20.h,
                width: 100.w,
                margin: EdgeInsets.symmetric(vertical: 3.5.h),
                color: Colors.white.withOpacity(0.5),
              ),
              Stack(
                alignment: Alignment.topRight,
                children: [
                  InkWell(
                    onTap: () {
                      pickImage();
                    },
                    child: Container(
                      height: 25.h,
                      width: 25.h,
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: gradientButton,
                      ),
                      child: file.path.isEmpty
                          ? Container(
                              height: 150,
                              width: 150,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              child: Icon(
                                Icons.photo_camera_outlined,
                                color: backgroundColor,
                                size: 70,
                              ),
                            )
                          : ClipOval(
                              child: Image.file(
                                file,
                                fit: BoxFit.fill,
                              ),
                            ),
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(40),
                    onTap: () {
                      pickImage();
                    },
                    child: Container(
                      height: 7.h,
                      width: 7.h,
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Icon(Icons.camera_alt_outlined,
                          size: 25.sp, color: backgroundColor),
                    ),
                  )
                ],
              ),
              height(5.h),
              Container(
                height: 7.5.h,
                width: 94.w,
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
                  child: TextField(
                    controller: txtNameController,
                    cursorColor: Colors.white,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontSize: 13.sp),
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: 'Enter NickName',
                      hintStyle: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 13.sp),
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onChanged: (value) {
                      controller.mStrName = value;
                      setState(() {});
                    },
                  ),
                ),
              ),
              height(2.5.h),
              Container(
                height: 7.5.h,
                width: 94.w,
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
                  child: TextField(
                    controller: txtEmailController,
                    cursorColor: Colors.white,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontSize: 13.sp),
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: 'Enter Email (optional)',
                      hintStyle: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 13.sp),
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onChanged: (value) {
                      controller.mStrName = value;
                      setState(() {});
                    },
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 14.h),
            child: Constants.confirmButton(() {
              if (txtNameController.text.length < 3) {
                Constants.snackBar(
                    "Validation", "Please enter attlist 3 latter's...");
              } else if (file.path.isEmpty) {
                Constants.snackBar(
                    "Profile image", "Please set profile image...");
              } else {
                Get.offAllNamed("/FavouriteCountryGirl");
              }
            }, "Continue"),
          ),
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
