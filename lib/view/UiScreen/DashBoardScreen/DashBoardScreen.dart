import 'dart:io';

import 'package:flutter/material.dart';
import 'package:girl_video_call/view/Constants/ConstantClass.dart';
import 'package:girl_video_call/view/UiScreen/DashBoardScreen/Chat/ChatScreen.dart';
import 'package:girl_video_call/view/UiScreen/DashBoardScreen/Explore/LikeScreen.dart';
import 'package:girl_video_call/view/UiScreen/DashBoardScreen/Home/HomeScreen.dart';
import 'package:girl_video_call/view/UiScreen/DashBoardScreen/profile/ProfileScreen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => exit(100),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundColor,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            IndexedStack(
              index: currentIndex,
              children: [
                HomeScreen(),
                ChatScreen(),
                LikeScreen(),
                ProfileScreen(),
              ],
            ),
            Container(
              height: 7.h,
              width: double.infinity,
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                  gradient: gradientColor,
                  borderRadius: BorderRadius.circular(40)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        currentIndex = 0;
                      });
                    },
                    child: Icon(
                        currentIndex == 0 ? Icons.home : Icons.home_outlined,
                        size: 28.sp),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        currentIndex = 1;
                      });
                    },
                    child: Icon(
                        currentIndex == 1
                            ? Icons.explore
                            : Icons.explore_outlined,
                        size: 28.sp),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        currentIndex = 2;
                        Constants.snackBar(
                            "Popular Images", "Click on image show unique");
                      });
                    },
                    child: Icon(
                        currentIndex == 2
                            ? Icons.favorite
                            : Icons.favorite_outline,
                        size: 28.sp),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        currentIndex = 3;
                      });
                    },
                    child: Icon(
                        currentIndex == 3 ? Icons.person : Icons.person_outline,
                        size: 28.sp),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
