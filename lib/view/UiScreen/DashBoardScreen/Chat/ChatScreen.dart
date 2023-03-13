import 'package:flutter/material.dart';
import 'package:girl_video_call/view/Constants/ConstantClass.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Constants.text("Explore", 30.px, Colors.white)),
              Constants.text("Models", 24.px, Colors.white),
              height(20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: [
                    image("assets/image/videoImage/11.png", "Anna, 20"),
                    image("assets/image/videoImage/12.png", "Lilly, 21"),
                    image("assets/image/videoImage/13.png", "Riya, 19"),
                    image("assets/image/videoImage/14.png", "Ruchi, 23"),
                    image("assets/image/videoImage/15.png", "Emma, 25"),
                    image("assets/image/videoImage/19.png", "Savi, 21"),
                    image("assets/image/videoImage/16.png", "Ridhdhi, 22"),
                    image("assets/image/videoImage/18.png", "Sophia, 26"),
                    image("assets/image/videoImage/17.png", "Bansi, 22"),
                    image("assets/image/videoImage/20.png", "Amelia, 23"),
                  ],
                ),
              ),
              height(20),
              Constants.text("Fashions", 24.px, Colors.white),
              height(20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: [
                    image("assets/image/videoImage/43.png", "Anna, 20"),
                    image("assets/image/videoImage/47.png", "Lilly, 21"),
                    image("assets/image/videoImage/44.png", "Riya, 19"),
                    image("assets/image/videoImage/49.png", "Ruchi, 23"),
                    image("assets/image/videoImage/41.png", "Emma, 25"),
                    image("assets/image/videoImage/45.png", "Savi, 21"),
                    image("assets/image/videoImage/48.png", "Ridhdhi, 22"),
                    image("assets/image/videoImage/50.png", "Sophia, 26"),
                    image("assets/image/videoImage/46.png", "Bansi, 22"),
                    image("assets/image/videoImage/42.png", "Amelia, 23"),
                  ],
                ),
              ),
              height(20),
              Constants.text("Actors", 24.px, Colors.white),
              height(20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: [
                    image("assets/image/videoImage/21.png", "Anna, 20"),
                    image("assets/image/videoImage/26.png", "Lilly, 21"),
                    image("assets/image/videoImage/27.png", "Riya, 19"),
                    image("assets/image/videoImage/23.png", "Ruchi, 23"),
                    image("assets/image/videoImage/24.png", "Emma, 25"),
                    image("assets/image/videoImage/22.png", "Savi, 21"),
                    image("assets/image/videoImage/30.png", "Ridhdhi, 22"),
                    image("assets/image/videoImage/24.png", "Sophia, 26"),
                    image("assets/image/videoImage/25.png", "Bansi, 22"),
                    image("assets/image/videoImage/29.png", "Amelia, 23"),
                  ],
                ),
              ),

              height(20),
              Constants.text("Players", 24.px, Colors.white),
              height(20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: [
                    image("assets/image/videoImage/32.png", "Anna, 20"),
                    image("assets/image/videoImage/34.png", "Lilly, 21"),
                    image("assets/image/videoImage/13.png", "Riya, 19"),
                    image("assets/image/videoImage/36.png", "Ruchi, 23"),
                    image("assets/image/videoImage/35.png", "Emma, 25"),
                    image("assets/image/videoImage/33.png", "Savi, 21"),
                    image("assets/image/videoImage/39.png", "Ridhdhi, 22"),
                    image("assets/image/videoImage/18.png", "Sophia, 26"),
                    image("assets/image/videoImage/40.png", "Bansi, 22"),
                    image("assets/image/videoImage/37.png", "Amelia, 23"),
                  ],
                ),
              ),
              height(20),
              Constants.text("Arts", 24.px, Colors.white),
              height(20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: [
                    image("assets/image/videoImage/1.png", "Anna, 20"),
                    image("assets/image/videoImage/3.png", "Riya, 19"),
                    image("assets/image/videoImage/10.png", "Amelia, 23"),
                    image("assets/image/videoImage/7.png", "Bansi, 22"),
                    image("assets/image/videoImage/2.png", "Lilly, 21"),
                    image("assets/image/videoImage/9.png", "Savi, 21"),
                    image("assets/image/videoImage/6.png", "Ridhdhi, 22"),
                    image("assets/image/videoImage/4.png", "Ruchi, 23"),
                    image("assets/image/videoImage/8.png", "Sophia, 26"),
                    image("assets/image/videoImage/5.png", "Emma, 25"),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  image(String pStrImage, String pStrName) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 22.h,
          width: 37.w,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              pStrImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 22.h,
          width: 37.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: 2.5.h,
                  width: 14.w,
                  margin: const EdgeInsets.only(top: 7, left: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: gradientColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Constants.text("New", 17.px, Colors.white),
                ),
              ),
              Container(
                height: 5.5.h,
                // margin: EdgeInsets.only(top: 5, left: 17),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
                child: Constants.text(pStrName, 17.px, Colors.black),
              ),
            ],
          ),
        )
      ],
    );
  }
}
