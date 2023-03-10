import 'package:flutter/material.dart';
import 'package:girl_video_call/view/Constants/ConstantClass.dart';
import 'package:girl_video_call/view/UiScreen/DashBoardScreen/Home/HomeScreen.dart';
import 'package:sizer/sizer.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          IndexedStack(
            index: currentIndex,
            children: [
              HomeScreen(),
              HomeScreen(),
              HomeScreen(),
              HomeScreen(),
            ],
          ),
          Container(
            height: 7.5.h,
            width: double.infinity,
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: BoxDecoration(
                gradient: gradientButton,
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
                      size: 30.sp),
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
                      size: 30.sp),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      currentIndex = 2;
                    });
                  },
                  child: Icon(
                      currentIndex == 2
                          ? Icons.chat
                          : Icons.chat_bubble_outline,
                      size: 30.sp),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      currentIndex = 3;
                    });
                  },
                  child: Icon(
                      currentIndex == 3
                          ? Icons.favorite_outlined
                          : Icons.favorite_outline,
                      size: 30.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}