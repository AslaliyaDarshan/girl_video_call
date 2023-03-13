import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:face_camera/face_camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girl_video_call/controller/HomeController.dart';
import 'package:girl_video_call/view/Constants/ConstantClass.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  HomeController controller = Get.put(HomeController());
  late VideoPlayerController videoController;

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
    setState(
      () {
        controller.mute.value = false;
        controller.camera.value = false;
        controller.enable.value = true;
        Timer(
          const Duration(seconds: 15),
          () => controller.enable.value = false,
        );
      },
    );
  }

  File? capturedImage;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => dialog(),
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: InkWell(
          onTap: () {
            if (controller.enable.value == false) {
              setState(() {
                controller.enable.value = true;
              });
              Timer(
                const Duration(seconds: 7),
                () => setState(() {
                  controller.enable.value = false;
                }),
              );
            } else {
              setState(() {
                controller.enable.value = false;
              });
            }
          },
          child: Container(
            height: 100.h,
            width: 100.w,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/image/bg.gif"),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Builder(
                builder: (context) {
                  if (capturedImage != null) {
                    return Center(
                      child: Image.file(capturedImage!),
                    );
                  }
                  return Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          SizedBox(
                            height: 100.h,
                            width: 100.w,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: videoController.value.isInitialized
                                  ? AspectRatio(
                                      aspectRatio:
                                          videoController.value.aspectRatio,
                                      child: VideoPlayer(videoController))
                                  : const Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              dialog();
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 6, right: 11),
                              height: 5.h,
                              width: 5.h,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.transparent),
                              child: Icon(Icons.close,
                                  size: 24.sp, color: Colors.transparent),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: controller.enable.value ? 11.h : 10,
                              right: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.27,
                              width: MediaQuery.of(context).size.width * 0.35,
                              child: SmartFaceCamera(
                                showCameraLensControl: false,
                                showFlashControl: false,
                                showControls: false,
                                defaultCameraLens: CameraLens.front,
                                onCapture: (File? image) {
                                  capturedImage = image;
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      controller.enable.value
                          ? Padding(
                              padding: EdgeInsets.only(bottom: 2.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (controller.camera.value == false) {
                                          controller.camera.value = true;
                                        } else {
                                          controller.camera.value = false;
                                        }
                                      });
                                    },
                                    child: Container(
                                      height: 8.h,
                                      width: 8.h,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: controller.camera.value
                                            ? Colors.white
                                            : Colors.white.withOpacity(0.5),
                                      ),
                                      child: Icon(
                                          controller.camera.value
                                              ? Icons.favorite
                                              : Icons.favorite_outline,
                                          size: 24.sp,
                                          color: Colors.red),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      dialog();
                                    },
                                    child: Container(
                                      height: 8.5.h,
                                      width: 8.5.h,
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red,
                                      ),
                                      child: Icon(Icons.call_end_rounded,
                                          size: 25.sp, color: Colors.white),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(
                                        () {
                                          if (controller.mute.value == false) {
                                            videoController.setVolume(0.0);
                                            controller.mute.value = true;
                                          } else {
                                            videoController.setVolume(1.0);
                                            controller.mute.value = false;
                                          }
                                        },
                                      );
                                    },
                                    child: Container(
                                      height: 8.h,
                                      width: 8.h,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: controller.mute.value
                                            ? Colors.white
                                            : Colors.white.withOpacity(0.5),
                                      ),
                                      child: Icon(
                                          controller.mute.value
                                              ? Icons.mic
                                              : Icons.mic_off_rounded,
                                          size: 24.sp),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox(),
                    ],
                  );
                },
              ),
            ),
          ),
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
