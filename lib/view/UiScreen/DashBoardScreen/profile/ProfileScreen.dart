import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girl_video_call/controller/HomeController.dart';
import 'package:girl_video_call/view/Constants/ConstantClass.dart';
import 'package:sizer/sizer.dart';

import '../DashBoardScreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: dialog,
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.5,
              width: 100.w,
              child: Image.asset(
                "assets/image/indian.jpg",
                fit: BoxFit.fill,
                // color: Colors.pink.shade50.withOpacity(0.4),
                colorBlendMode: BlendMode.modulate,
              ),
            ),
            Stack(
              alignment: Alignment.topLeft,
              children: [
                // height(MediaQuery.of(context).size.height / 3),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 3),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 15,
                      right: 15,
                      top: MediaQuery.of(context).size.height * 0.1),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 6.3,
                              left: 5),
                          // padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 6,
                              color: backgroundColor,
                            ),
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: Colors.white.withOpacity(0.4),
                            //     blurRadius: 25,
                            //     spreadRadius: 2,
                            //     offset: const Offset(2, 7),
                            //   ),
                            // ],
                          ),
                          child: const CircleAvatar(
                            maxRadius: 70,
                            backgroundImage: AssetImage(
                                "assets/image/indian.jpg") /* FileImage(File(controller.mStrFileName))*/,
                          ),
                        ),
                        Row(
                          children: [
                            Constants.text(
                              "Darshan Aslaliya ",
                              25.sp,
                              Colors.white.withOpacity(0.9),
                            ),
                            const Icon(
                              Icons.verified,
                              color: Colors.blue,
                              size: 25,
                            )
                          ],
                        ),
                        height(10),
                        Constants.text(
                          "@ DarshanAslaliya",
                          22,
                          Colors.white.withOpacity(0.9),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 15),
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(11),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Constants.text(
                                "12K \n Followers",
                                20.sp,
                                Colors.white.withOpacity(0.9),
                              ),
                              Constants.text(
                                "125 \n Following",
                                20.sp,
                                Colors.white.withOpacity(0.9),
                              ),
                            ],
                          ),
                        ),
                        Constants.text(
                          "Media",
                          25.sp,
                          Colors.white,
                        ),
                        height(15),
                        SizedBox(
                          height: 250,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.dataList.length,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 250,
                                width: 120,
                                margin: const EdgeInsets.symmetric(horizontal: 12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.red,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset("${controller.dataList[index].image}",fit: BoxFit.cover),
                                ),
                              );
                            },
                          ),
                        ),
                        height(9.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> dialog() async {
    back();
    return false;
  }

  back() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const DashBoardScreen()));
  }

  detail(IconData pIcon, String pStrName, String pStrDetail) {
    return ListTile(
      leading: Container(
        height: 4.5.h,
        width: 4.5.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 3,
            color: Colors.pink.shade300,
          ),
        ),
        child: Icon(pIcon, color: Colors.pink.shade400, size: 20.sp),
      ),
      title: Constants.text(pStrName, 20, Colors.pink.shade400),
      trailing: Constants.text(
        pStrDetail,
        20,
        Colors.black,
      ),
    );
  }
}
