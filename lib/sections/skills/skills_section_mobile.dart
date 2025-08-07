import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/helpers/helper_functions.dart';

import '../../common/widgets/unorder_list.dart';
import '../../constantss/texts.dart';
import '../../controllers/app_scrolling_controller.dart';

class SkillsSectionMobile extends StatelessWidget {
  const SkillsSectionMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = Get.find<AppScrollingController>();
    bool isMobile = HelperFunctions.isMobile(context);
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
                          fontSize: isMobile ? 30 : 40,
                          fontFamily: "Montserrat",
                          fontWeight: isMobile ? FontWeight.w400 : FontWeight.w200,
                        ),
                      ),

                      SizedBox(height: 40),

                      UnorderedList(title: Texts.frontEndSkills, items: Texts.frontEndSkillsList),

                      SizedBox(height: 40),

                      UnorderedList(title: Texts.backEndSkills, items: Texts.backEndSkillsList),
                      SizedBox(height: 40),
                      UnorderedList(
                        title: Texts.architectureAndCleanCode,
                        items: Texts.architectureAndCleanCodeList,
                      ),
                      SizedBox(height: 40),
                      UnorderedList(
                        title: Texts.toolsAndTechnologies,
                        items: Texts.toolsAndTechnologiesList,
                      ),

                      // section description
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
