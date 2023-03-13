import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girl_video_call/controller/HomeController.dart';
import 'package:girl_video_call/model/ModelClass.dart';
import 'package:girl_video_call/view/UiScreen/DashBoardScreen/Explore/LikeScreen.dart';
import 'package:sizer/sizer.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.builder(
      itemCount: controller.dataList.length,
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 32.h,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            controller.modelClass = ModelClass(
                image: controller.dataList[index].image,
                video: controller.dataList[index].video);
            // Navigator.push(
            //   context,
            //   PageTransition(
            //       duration: const Duration(milliseconds: 1300),
            //       type: PageTransitionType.theme,
            //       alignment: Alignment.center,
            //       childCurrent: HomeScreen(),
            //       child: const VideoScreen(),
            //       inheritTheme: true,
            //       ctx: context),
            // );
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
              child: Image.asset(
                "${controller.dataList[index].image}",
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    ));
  }
}
