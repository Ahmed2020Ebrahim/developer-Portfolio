import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/common/widgets/ended_divider.dart';
import 'package:my_portfolio/sections/contact/contact_section_desktop.dart';
import 'package:my_portfolio/sections/education/education_section_tablet.dart';

import '../controllers/app_scrolling_controller.dart';
import '../sections/about_me/about_me_section_tablet.dart';
import '../sections/footer/footer_section_responsive.dart';
import '../sections/intro/intro_section_responsive.dart';
import '../sections/projects/project_section_responsive.dart';
import '../sections/services/services_section_responsive.dart';
import '../sections/skills/skills_section_tablet.dart';

class PortfolioPageTablet extends StatelessWidget {
  const PortfolioPageTablet({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = Get.put(AppScrollingController());

    return SingleChildScrollView(
      controller: scrollController.scrollController,
      child: Column(
        children: [
          //
          //
          //intro section
          IntroSectionResponsive(),
          //space
          SizedBox(height: 75),
          //divider at the end
          EndedDivider(),
          //space
          SizedBox(height: 150),

          //
          //
          //about me section
          AboutMeSectionTablet(),
          //space
          SizedBox(height: 75),
          //divider at the end
          EndedDivider(),
          //space
          SizedBox(height: 150),

          //
          //
          //skills section
          SkillsSectionTablet(),
          //space
          SizedBox(height: 75),
          //divider at the end
          EndedDivider(),
          //space
          SizedBox(height: 150),

          //
          //
          //services section
          ServicesSectionResponsive(),
          // space
          SizedBox(height: 75),
          // divider at the end
          EndedDivider(),
          // space
          SizedBox(height: 200),

          //
          //
          //projects section
          ProjectSectionResponsive(),
          //space
          SizedBox(height: 75),
          //divider at the end
          EndedDivider(),
          //space
          SizedBox(height: 200),

          //
          //
          //education section
          EducationSectionTablet(),
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
