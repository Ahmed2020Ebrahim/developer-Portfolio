import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/widgets/circle_assete_image.dart';
import '../../common/widgets/section_title.dart';
import '../../constantss/texts.dart';
import '../../controllers/app_scrolling_controller.dart';

class AboutMeSectionDesktop extends StatelessWidget {
  const AboutMeSectionDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = Get.find<AppScrollingController>();
    return Container(
      key: scrollController.aboutKey,
      color: Colors.transparent,
      child: Column(
        children: [
          Row(
            children: [
              //circle image has the half of the screen
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  child: CircleAssetImage(imagePath: "assets/images/my_image_2.jpg", radius: 220),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionTitle(title: Texts.aboutMe),
                      SizedBox(height: 20),
                      Text(
                        Texts.aboutMeDescription,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
