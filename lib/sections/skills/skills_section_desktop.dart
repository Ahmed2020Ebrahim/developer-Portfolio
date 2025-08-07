import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/widgets/unorder_list.dart';
import '../../constantss/texts.dart';
import '../../controllers/app_scrolling_controller.dart';

class SkillsSectionDesktop extends StatelessWidget {
  const SkillsSectionDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = Get.find<AppScrollingController>();
    return Container(
      key: scrollController.skillsKey,
      color: Colors.transparent,
      alignment: Alignment.topLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //circle image has the half of the screen
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 60),
                  alignment: Alignment.topLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // section title
                      Text(
                        Texts.skillsTitle,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w200,
                        ),
                      ),

                      SizedBox(height: 40),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // section description
                          Expanded(
                            flex: 1,
                            child: UnorderedList(
                              title: Texts.frontEndSkills,
                              items: Texts.frontEndSkillsList,
                            ),
                          ),
                          // space
                          SizedBox(width: 30),
                          // section description
                          Expanded(
                            flex: 1,
                            child: UnorderedList(
                              title: Texts.backEndSkills,
                              items: Texts.backEndSkillsList,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // section description
                          Expanded(
                            flex: 1,
                            child: UnorderedList(
                              title: Texts.architectureAndCleanCode,
                              items: Texts.architectureAndCleanCodeList,
                            ),
                          ),
                          // space
                          SizedBox(width: 30),
                          // section description
                          Expanded(
                            flex: 1,
                            child: UnorderedList(
                              title: Texts.toolsAndTechnologies,
                              items: Texts.toolsAndTechnologiesList,
                            ),
                          ),
                        ],
                      ),

                      // section description
                    ],
                  ),
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
                      Image.asset(
                        "assets/images/image-3.jpg",
                        width: 650,
                        height: 550,
                        fit: BoxFit.cover,
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
