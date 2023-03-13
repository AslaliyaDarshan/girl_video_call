import 'package:face_camera/face_camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:girl_video_call/view/UiScreen/AddNameScreen.dart';
import 'package:girl_video_call/view/UiScreen/BestPhotoScreen.dart';
import 'package:girl_video_call/view/UiScreen/DashBoardScreen/DashBoardScreen.dart';
import 'package:girl_video_call/view/UiScreen/DashBoardScreen/Home/HomeScreen.dart';
import 'package:girl_video_call/view/UiScreen/FavouriteCountryGirl.dart';
import 'package:girl_video_call/view/UiScreen/HelloScreen.dart';
import 'package:girl_video_call/view/UiScreen/InterestScreen.dart';
import 'package:girl_video_call/view/UiScreen/IntroScreen.dart';
import 'package:girl_video_call/view/UiScreen/IntroScreen1.dart';
import 'package:girl_video_call/view/UiScreen/IntroScreen2.dart';
import 'package:girl_video_call/view/UiScreen/PolicyScreen.dart';
import 'package:girl_video_call/view/UiScreen/SelectGenderScreen.dart';
import 'package:girl_video_call/view/UiScreen/SplashScreen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // MobileAds.instance.initialize();
  await FaceCamera.initialize();
  SystemChrome.setPreferredOrientations([
    // DeviceOrientation.portraitUp,
    // DeviceOrientation.portraitDown,
  ]).then(
    (value) => runApp(
      ResponsiveSizer(
        builder: (p0, p1, p2) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              "/": (context) => const SplashScreen(),
              "/PolicyScreen": (context) => const PolicyScreen(),
              "/IntroScreen": (context) => const IntroScreen(),
              "/IntroScreen1": (context) => const IntroScreen1(),
              "/IntroScreen2": (context) => const IntroScreen2(),
              "/InterestScreen": (context) => const InterestScreen(),
              "/SelectGenderScreen": (context) => const SelectGenderScreen(),
              "/HelloScreen": (context) => const HelloScreen(),
              "/BestPhotoScreen": (context) => const BestPhotoScreen(),
              "/AddNameScreen": (context) => const AddNameScreen(),
              "/FavouriteCountryGirl": (context) =>
                  const FavouriteCountryGirl(),
              "/DashBoardScreen": (context) => const DashBoardScreen(),
              "/HomeScreen": (context) => HomeScreen(),
            },
          );
        },
      ),
    ),
  );
}
