import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/common/widgets/ended_divider.dart';
import 'package:my_portfolio/sections/contact/contact_section_mobile.dart';
import 'package:my_portfolio/sections/education/education_section_mobile.dart';
import 'package:my_portfolio/sections/projects/projects_section_mobile.dart';
import 'package:my_portfolio/sections/skills/skills_section_mobile.dart';
import '../controllers/app_scrolling_controller.dart';
import '../sections/about_me/about_me_section_mobile.dart';
import '../sections/intro/intro_section_responsive.dart';

class PortfolioPageMobile extends StatelessWidget {
  const PortfolioPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = Get.put(AppScrollingController());

    return SingleChildScrollView(
      controller: scrollController.scrollController,
      child: Column(
        children: [
          //space
          SizedBox(height: 30),

          //
          //
          // Intro section
          IntroSectionResponsive(),
          //space
          SizedBox(height: 75),
          // Divider at the end
          EndedDivider(),
          //space
          SizedBox(height: 75),

          //
          //
          //about me section
          AboutMeSectionMobile(),
          //space
          SizedBox(height: 75),
          //divider at the end
          EndedDivider(),
          //space
          SizedBox(height: 100),

          //
          //
          //skills section
          SkillsSectionMobile(),
          //space
          SizedBox(height: 75),
          //divider at the end
          EndedDivider(),
          //space
          SizedBox(height: 100),

          //
          //
          //projects section
          ProjectsSectionMobile(),
          //space
          SizedBox(height: 125),
          //divider at the end
          EndedDivider(),
          //space
          SizedBox(height: 200),

          //
          //
          //eductation section
          EducationSectionMobile(),
          //space
          SizedBox(height: 75),
          //divider at the end
          EndedDivider(),
          //space
          SizedBox(height: 200),

          //
          //
          //contact section
          ContactSectionMobile(),
          //space
          SizedBox(height: 75),
          //divider at the end
          EndedDivider(),
          //space
          SizedBox(height: 200),
        ],
      ),
    );
  }
}
