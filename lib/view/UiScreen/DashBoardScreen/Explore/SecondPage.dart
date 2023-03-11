import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girl_video_call/controller/HomeController.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late VideoPlayerController videoController;
  HomeController controller = Get.put(HomeController());
  @override
  void initState() {
    videoController =
        VideoPlayerController.asset("${controller.modelClass?.video}")
          ..initialize().then(
            (value) {
              setState(() {
                videoController.setLooping(true);
                videoController.play();
              });
            },
          );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 100.w,
        height: 100.h,
        child: DismissiblePage(
          child: SizedBox(
            height: 100.h,
            width: 100.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: videoController.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: videoController.value.aspectRatio,
                      child: VideoPlayer(videoController))
                  : const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
            ),
          ),
          onDismissed: () {
            dialog();
            Get.back();
          },
        ),
      ),
    );
  }

  Future<bool> dialog() async {
    controller.playPause();
    videoController.pause();
    Get.toNamed("/DashBoardScreen");
    return false;
  }

  @override
  dispose() {
    super.dispose();
    dialog();
  }
}
