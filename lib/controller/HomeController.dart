import 'package:get/get.dart';
import 'package:girl_video_call/model/ModelClass.dart';

class HomeController extends GetxController {
  List<String> image = [];
  int select = 1;
  int select1 = 1;
  RxBool man = false.obs;
  RxBool woMan = false.obs;
  String mStrName = "Admin";
  late String mStrFileName = "";

  ModelClass? modelClass;
  List<ModelClass> list = [
    ModelClass(
        image: "assets/image/videoImage/indian.jpg",
        video: "assets/image/video/1.mp4"),
    ModelClass(
        image: "assets/image/videoImage/korean.jpg",
        video: "assets/image/video/2.mp4"),
    ModelClass(
        image: "assets/image/videoImage/maliasian.jpg",
        video: "assets/image/video/3.mp4"),
    ModelClass(
        image: "assets/image/videoImage/newzealand.jpg",
        video: "assets/image/video/4.mp4"),
    ModelClass(
        image: "assets/image/videoImage/pakistani.jpg",
        video: "assets/image/video/5.mp4"),
    ModelClass(
        image: "assets/image/videoImage/rasian.jpg",
        video: "assets/image/video/6.mp4"),
    ModelClass(
        image: "assets/image/videoImage/thailand.jpg",
        video: "assets/image/video/7.mp4"),
    ModelClass(
        image: "assets/image/videoImage/turki.jpg",
        video: "assets/image/video/8.mp4"),
    ModelClass(
        image: "assets/image/videoImage/ukrain.jpg",
        video: "assets/image/video/9.mp4"),
    ModelClass(
        image: "assets/image/videoImage/usa.jpg",
        video: "assets/image/video/10.mp4"),
  ];
}
