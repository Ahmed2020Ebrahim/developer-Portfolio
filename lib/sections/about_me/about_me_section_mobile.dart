import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/helpers/helper_functions.dart';

import '../../common/widgets/circle_assete_image.dart';
import '../../constantss/texts.dart';
import '../../controllers/app_scrolling_controller.dart';

class AboutMeSectionMobile extends StatelessWidget {
  const AboutMeSectionMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = Get.find<AppScrollingController>();
    bool isMobile = HelperFunctions.isMobile(context);
    return Container(
      key: scrollController.aboutKey,
      color: Colors.transparent,
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Text(
            Texts.aboutMe,
            style: TextStyle(
              color: Colors.white,
              fontSize: 60,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Container(
            alignment: Alignment.center,
            child: CircleAssetImage(
              imagePath: "assets/images/my_image.jpg",
              radius: isMobile ? 150 : 200,
            ),
          ),
          //space
          SizedBox(height: 40),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Texts.aboutMeDescription,
                  textAlign: isMobile ? TextAlign.center : TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isMobile ? 22 : 20,
                    fontFamily: "Montserrat",
                    fontWeight: isMobile ? FontWeight.w300 : FontWeight.w200,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
