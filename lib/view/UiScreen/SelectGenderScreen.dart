import 'package:flutter/material.dart';
import 'package:girl_video_call/view/Constants/ConstantClass.dart';
import 'package:sizer/sizer.dart';

class SelectGenderScreen extends StatefulWidget {
  const SelectGenderScreen({Key? key}) : super(key: key);

  @override
  State<SelectGenderScreen> createState() => _SelectGenderScreenState();
}

class _SelectGenderScreenState extends State<SelectGenderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {},
                child: Container(
                  height: 30.h,
                  width: 43.w,
                  margin: const EdgeInsets.all(7),
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    gradient: gradientButton,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset("assets/image/man.png")),
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {},
                child: Container(
                  height: 30.h,
                  width: 43.w,
                  margin: const EdgeInsets.all(7),
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    gradient: gradientButton,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset("assets/image/women.png")),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
