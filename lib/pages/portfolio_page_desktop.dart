import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/common/widgets/ended_divider.dart';
import 'package:my_portfolio/controllers/project_card_controller.dart';
import 'package:my_portfolio/sections/contact/contact_section_desktop.dart';
import 'package:my_portfolio/sections/footer/footer_section_responsive.dart';
import '../controllers/app_scrolling_controller.dart';
import '../sections/about_me/about_me_section_desktop.dart';
import '../sections/education/education_section_desktop.dart';
import '../sections/intro/intro_section_responsive.dart';
import '../sections/projects/project_section_responsive.dart';
import '../sections/services/services_section_responsive.dart';
import '../sections/skills/skills_section_desktop.dart';

class PortfolioPageDesktop extends StatelessWidget {
  const PortfolioPageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = Get.put(AppScrollingController());
    Get.put(ProjectCardController());

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
          SizedBox(height: 150),
          //divider at the end
          EndedDivider(),
          //space
          SizedBox(height: 150),

          //
          //
          //services section
          ServicesSectionResponsive(),
          // space
          SizedBox(height: 150),
          // divider at the end
          EndedDivider(),
          // space
          SizedBox(height: 150),

          //
          //
          //project section
          ProjectSectionResponsive(),
          //space
          SizedBox(height: 150),
          //divider at the end
          EndedDivider(),
          //space
          SizedBox(height: 150),

          //
          //
          //eductation section
          EducationSectionDesktop(),
          //space
          SizedBox(height: 150),
          //divider at the end
          EndedDivider(),
          //space
          SizedBox(height: 150),

          //
          //
          //contact section
          ContactSectionDesktop(),
          //space
          SizedBox(height: 100),

          //
          //
          //footer section
          FooterSectionResponsive(),
        ],
      ),
    );
  }
}
