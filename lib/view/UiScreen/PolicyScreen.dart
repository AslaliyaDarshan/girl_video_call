import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girl_video_call/view/Constants/ConstantClass.dart';
import 'package:girl_video_call/view/UiScreen/IntroScreen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';

class PolicyScreen extends StatefulWidget {
  const PolicyScreen({Key? key}) : super(key: key);

  @override
  State<PolicyScreen> createState() => _PolicyScreenState();
}

class _PolicyScreenState extends State<PolicyScreen> {
  bool agree = false;
  bool disagree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          height(9.h),
          Container(
            height: 75.h,
            width: 100.w,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                    color: Colors.white60.withOpacity(0.3),
                    // offset: const Offset(-3, -3),
                    blurRadius: 25,
                    spreadRadius: 1),
                BoxShadow(
                    color: Colors.white60.withOpacity(0.3),
                    blurRadius: 25,
                    spreadRadius: 1),
              ],
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset("assets/image/img.png", fit: BoxFit.fill),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.5),
                  child: Column(
                    children: [
                      SelectableText(
                        """   Terms and Condition""",
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 20.sp),
                      ),
                      SelectableText(
                        """      
                          
       Introduction These Application 
Terms and Conditions written on this application shall manage your use of this application. These Terms will be applied fully and affect tp your use of this Application. By using this Application, you agreed to accept all terms and conditions written in here. You must not use this Application if you disagree with any of these Application Standard Terms and Conditions.
 
 Minors or people below 18 years old not allowed to use this Application.
 """,
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 15.sp),
                      ),
                      CheckboxListTile(
                        title: Text(
                          'I Agree with The Terms And Condition',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                        activeColor: Colors.white,
                        checkColor: Colors.black,
                        side: const BorderSide(color: Colors.white),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: agree,
                        onChanged: (value) {
                          agree = true;
                          disagree = false;
                          setState(() {});
                        },
                      ),
                      CheckboxListTile(
                        title: Text(
                          'I Do Not Agree with The Terms And Condition',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                        activeColor: Colors.white,
                        checkColor: Colors.black,
                        controlAffinity: ListTileControlAffinity.leading,
                        side: const BorderSide(color: Colors.white),
                        value: disagree,
                        onChanged: (value) {
                          agree = false;
                          disagree = true;
                          Get.snackbar(
                            "Terms and Condition",
                            "Please agree to the terms & conditions and go next...",
                            colorText: Colors.white,
                            barBlur: 25,
                            margin: const EdgeInsets.only(bottom: 50),
                            animationDuration: const Duration(seconds: 3),
                            overlayBlur: 15,
                            snackPosition: SnackPosition.BOTTOM,
                            icon: Icon(
                              Icons.add_alert,
                              color: Colors.white.withOpacity(0.9),
                            ),
                          );
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          height(1.5.h),
          agree
              ? Constants.confirmButton(() {
                  Navigator.push(
                    context,
                    PageTransition(
                        duration: const Duration(milliseconds: 1200),
                        curve: Curves.slowMiddle,
                        type: PageTransitionType.fade,
                        alignment: Alignment.center,
                        child: const IntroScreen(),
                        inheritTheme: true,
                        ctx: context),
                  );
                }, "Confirm")
              : Container(),
          height(3.h),
        ],
      ),
    );
  }
}
