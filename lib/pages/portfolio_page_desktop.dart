import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/common/widgets/ended_divider.dart';
import 'package:my_portfolio/sections/contact/contact_section_desktop.dart';
import '../controllers/app_scrolling_controller.dart';
import '../sections/about_me/about_me_section_desktop.dart';
import '../sections/education/education_section_desktop.dart';
import '../sections/intro/intro_section_responsive.dart';
import '../sections/projects/projects_section_desktop.dart';
import '../sections/skills/skills_section_desktop.dart';

class PortfolioPageDesktop extends StatelessWidget {
  const PortfolioPageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = Get.put(AppScrollingController());

    return SingleChildScrollView(
      controller: scrollController.scrollController,
      child: Column(
        children: [
          //
          //
          // Intro section
          IntroSectionResponsive(),
          //space
          SizedBox(height: 75),
          // Divider at the end
          EndedDivider(),
          //space
          SizedBox(height: 150),

          //
          //
          //about me section
          AboutMeSectionDesktop(),
          //space
          SizedBox(height: 75),
          //divider at the end
          EndedDivider(),
          //space
          SizedBox(height: 200),

          //
          //
          //skills section
          SkillsSectionDesktop(),
          //space
          SizedBox(height: 75),
          //divider at the end
          EndedDivider(),
          //space
          SizedBox(height: 200),

          //
          //
          //project section
          ProjectsSectionDesktop(),
          //space
          SizedBox(height: 75),
          //divider at the end
          EndedDivider(),
          //space
          SizedBox(height: 200),

          //
          //
          //eductation section
          EducationSectionDesktop(),
          //space
          SizedBox(height: 75),
          //divider at the end
          EndedDivider(),
          //space
          SizedBox(height: 200),

          //
          //
          //contact section
          ContactSectionDesktop(),
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
