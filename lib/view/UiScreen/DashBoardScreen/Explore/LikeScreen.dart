import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';
import 'package:girl_video_call/controller/HomeController.dart';
import 'package:girl_video_call/view/Constants/ConstantClass.dart';
import 'package:lightbox/lightbox.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LikeScreen extends StatefulWidget {
  const LikeScreen({Key? key}) : super(key: key);

  @override
  State<LikeScreen> createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {
  HomeController controller = Get.put(HomeController());
  ValueNotifier stop = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height(MediaQuery.of(context).size.height * 0.03),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Constants.gradientText("Popular Images", 31.sp),
            ),
            Container(
              height: 75.h,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Swiper(
                physics: const BouncingScrollPhysics(),
                duration: 3,
                itemCount: controller.assetsImage.length,
                autoplay: true,
                itemBuilder: (context, index) {
                  return Stack(
                    fit: StackFit.expand,
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 70.h,
                        width: 95.w,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            "${controller.dataList[index].image}",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        height: 70.h,
                        width: 95.w,
                        alignment: Alignment.bottomCenter,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [
                                Colors.transparent,
                                Colors.transparent,
                                Color(0xFFd729bb),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 6.h,
                              width: 6.h,
                              child: ClipOval(
                                child: Image.asset(
                                    "${controller.dataList[index].image}",
                                    fit: BoxFit.cover),
                              ),
                            ),
                            width(10),
                            Constants.text(
                                "Ria 💋💕, 12km", 17.sp, Colors.white),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                onTap: (index) {
                  Navigator.push(
                    context,
                    LightBoxRoute(
                      dismissible: false,
                      builder: (BuildContext context) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: LightBox(
                            closeIconColor: Colors.white,
                            closeTextColor: Colors.white,
                            nextTextColor: Colors.red,
                            nextText: "Image",
                            nextIconColor: Colors.white,
                            prevIconColor: Colors.white,
                            prevTextColor: Colors.white,
                            blur: 12,
                            images: controller.assetsImage,
                            initialIndex: index,
                            imageType: ImageType.ASSET,
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10.0),
        scrollDirection: Axis.horizontal,
        itemCount: imagesAsset.length,
        itemBuilder: (context, position) {
          return GestureDetector(
            child: SizedBox(
                height: 200,
                width: 200,
                child: Image.asset(
                  imagesAsset[position],
                  fit: BoxFit.cover,
                )),
            onTap: () {
              Navigator.push(
                context,
                LightBoxRoute(
                    builder: (BuildContext context) {
                      return LightBox(
                        images: imagesAsset,
                        initialIndex: position,
                        imageType: ImageType.ASSET,
                      );
                    },
                    dismissible: false),
              );
            },
          );
        },
      )*/
