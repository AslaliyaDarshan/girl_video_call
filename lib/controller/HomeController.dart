import 'package:get/get.dart';
import 'package:girl_video_call/model/ModelClass.dart';

class HomeController extends GetxController {
  List<String> bestImageList = [];

  RxInt select = 1.obs;
  RxInt select1 = 1.obs;

  RxBool man = false.obs;
  RxBool woMan = false.obs;
  RxBool enable = true.obs;
  RxBool camera = false.obs;
  RxBool mute = false.obs;
  bool mBlnIsPlay = false;

  String mStrName = "Admin";
  String mStrFileName = "";

  void playPause() {
    mBlnIsPlay = !mBlnIsPlay;
    update();
  }

  final List<String> assetsImage = [
    "assets/image/videoImage/1.png",
    "assets/image/videoImage/2.png",
    "assets/image/videoImage/3.png",
    "assets/image/videoImage/4.png",
    "assets/image/videoImage/5.png",
    "assets/image/videoImage/6.png",
    "assets/image/videoImage/7.png",
    "assets/image/videoImage/8.png",
    "assets/image/videoImage/24.png",
    "assets/image/videoImage/50.png",
    "assets/image/videoImage/48.png",
    "assets/image/videoImage/9.png",
    "assets/image/videoImage/25.png",
    "assets/image/videoImage/10.png",
    "assets/image/videoImage/35.png",
    "assets/image/videoImage/11.png",
    "assets/image/videoImage/49.png",
    "assets/image/videoImage/26.png",
    "assets/image/videoImage/36.png",
    "assets/image/videoImage/46.png",
    "assets/image/videoImage/27.png",
    "assets/image/videoImage/12.png",
    "assets/image/videoImage/37.png",
    "assets/image/videoImage/28.png",
    "assets/image/videoImage/13.png",
    "assets/image/videoImage/43.png",
    "assets/image/videoImage/38.png",
    "assets/image/videoImage/29.png",
    "assets/image/videoImage/14.png",
    "assets/image/videoImage/44.png",
    "assets/image/videoImage/45.png",
    "assets/image/videoImage/15.png",
    "assets/image/videoImage/30.png",
    "assets/image/videoImage/47.png",
    "assets/image/videoImage/16.png",
    "assets/image/videoImage/40.png",
    "assets/image/videoImage/31.png",
    "assets/image/videoImage/41.png",
    "assets/image/videoImage/32.png",
    "assets/image/videoImage/17.png",
    "assets/image/videoImage/33.png",
    "assets/image/videoImage/23.png",
    "assets/image/videoImage/18.png",
    "assets/image/videoImage/34.png",
    "assets/image/videoImage/42.png",
    "assets/image/videoImage/22.png",
    "assets/image/videoImage/19.png",
    "assets/image/videoImage/39.png",
    "assets/image/videoImage/21.png",
    "assets/image/videoImage/20.png",
  ];
  ModelClass? modelClass;
  List dataList = [
    ModelClass(
        image: "assets/image/videoImage/1.png",
        video: "assets/image/video/1.mp4"),
    ModelClass(
        image: "assets/image/videoImage/2.png",
        video: "assets/image/video/2.mp4"),
    ModelClass(
        image: "assets/image/videoImage/3.png",
        video: "assets/image/video/3.mp4"),
    ModelClass(
        image: "assets/image/videoImage/4.png",
        video: "assets/image/video/4.mp4"),
    ModelClass(
        image: "assets/image/videoImage/5.png",
        video: "assets/image/video/5.mp4"),
    ModelClass(
        image: "assets/image/videoImage/6.png",
        video: "assets/image/video/6.mp4"),
    ModelClass(
        image: "assets/image/videoImage/7.png",
        video: "assets/image/video/7.mp4"),
    ModelClass(
        image: "assets/image/videoImage/8.png",
        video: "assets/image/video/8.mp4"),
    ModelClass(
        image: "assets/image/videoImage/9.png",
        video: "assets/image/video/9.mp4"),
    ModelClass(
        image: "assets/image/videoImage/10.png",
        video: "assets/image/video/10.mp4"),
    ModelClass(
        image: "assets/image/videoImage/11.png",
        video: "assets/image/video/11.mp4"),
    ModelClass(
        image: "assets/image/videoImage/12.png",
        video: "assets/image/video/12.mp4"),
    ModelClass(
        image: "assets/image/videoImage/13.png",
        video: "assets/image/video/13.mp4"),
    ModelClass(
        image: "assets/image/videoImage/14.png",
        video: "assets/image/video/14.mp4"),
    ModelClass(
        image: "assets/image/videoImage/15.png",
        video: "assets/image/video/15.mp4"),
    ModelClass(
        image: "assets/image/videoImage/16.png",
        video: "assets/image/video/16.mp4"),
    ModelClass(
        image: "assets/image/videoImage/17.png",
        video: "assets/image/video/17.mp4"),
    ModelClass(
        image: "assets/image/videoImage/18.png",
        video: "assets/image/video/18.mp4"),
    ModelClass(
        image: "assets/image/videoImage/19.png",
        video: "assets/image/video/19.mp4"),
    ModelClass(
        image: "assets/image/videoImage/20.png",
        video: "assets/image/video/20.mp4"),
    ModelClass(
        image: "assets/image/videoImage/21.png",
        video: "assets/image/video/22.mp4"),
    ModelClass(
        image: "assets/image/videoImage/22.png",
        video: "assets/image/video/23.mp4"),
    ModelClass(
        image: "assets/image/videoImage/23.png",
        video: "assets/image/video/24.mp4"),
    ModelClass(
        image: "assets/image/videoImage/24.png",
        video: "assets/image/video/25.mp4"),
    ModelClass(
        image: "assets/image/videoImage/25.png",
        video: "assets/image/video/26.mp4"),
    ModelClass(
        image: "assets/image/videoImage/26.png",
        video: "assets/image/video/27.mp4"),
    ModelClass(
        image: "assets/image/videoImage/27.png",
        video: "assets/image/video/28.mp4"),
    ModelClass(
        image: "assets/image/videoImage/28.png",
        video: "assets/image/video/29.mp4"),
    ModelClass(
        image: "assets/image/videoImage/29.png",
        video: "assets/image/video/30.mp4"),
    ModelClass(
        image: "assets/image/videoImage/30.png",
        video: "assets/image/video/9.mp4"),
    ModelClass(
        image: "assets/image/videoImage/31.png",
        video: "assets/image/video/12.mp4"),
    ModelClass(
        image: "assets/image/videoImage/32.png",
        video: "assets/image/video/2.mp4"),
    ModelClass(
        image: "assets/image/videoImage/33.png",
        video: "assets/image/video/22.mp4"),
    ModelClass(
        image: "assets/image/videoImage/34.png",
        video: "assets/image/video/7.mp4"),
    ModelClass(
        image: "assets/image/videoImage/35.png",
        video: "assets/image/video/17.mp4"),
    ModelClass(
        image: "assets/image/videoImage/36.png",
        video: "assets/image/video/19.mp4"),
    ModelClass(
        image: "assets/image/videoImage/37.png",
        video: "assets/image/video/1.mp4"),
    ModelClass(
        image: "assets/image/videoImage/38.png",
        video: "assets/image/video/10.mp4"),
    ModelClass(
        image: "assets/image/videoImage/39.png",
        video: "assets/image/video/23.mp4"),
    ModelClass(
        image: "assets/image/videoImage/40.png",
        video: "assets/image/video/15.mp4"),
    ModelClass(
        image: "assets/image/videoImage/41.png",
        video: "assets/image/video/27.mp4"),
    ModelClass(
        image: "assets/image/videoImage/42.png",
        video: "assets/image/video/13.mp4"),
    ModelClass(
        image: "assets/image/videoImage/43.png",
        video: "assets/image/video/5.mp4"),
    ModelClass(
        image: "assets/image/videoImage/44.png",
        video: "assets/image/video/29.mp4"),
    ModelClass(
        image: "assets/image/videoImage/45.png",
        video: "assets/image/video/16.mp4"),
    ModelClass(
        image: "assets/image/videoImage/46.png",
        video: "assets/image/video/21.mp4"),
    ModelClass(
        image: "assets/image/videoImage/47.png",
        video: "assets/image/video/4.mp4"),
    ModelClass(
        image: "assets/image/videoImage/48.png",
        video: "assets/image/video/20.mp4"),
    ModelClass(
        image: "assets/image/videoImage/49.png",
        video: "assets/image/video/24.mp4"),
    ModelClass(
        image: "assets/image/videoImage/50.png",
        video: "assets/image/video/30.mp4"),
  ];
}
