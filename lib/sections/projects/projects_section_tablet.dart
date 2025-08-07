import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/widgets/project_card.dart';
import '../../common/widgets/section_title.dart';
import '../../constantss/texts.dart';
import '../../controllers/app_scrolling_controller.dart';

class ProjectsSectionTablet extends StatelessWidget {
  const ProjectsSectionTablet({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = Get.find<AppScrollingController>();
    final screenWidth = MediaQuery.of(context).size.width;

    // التحكم في عرض الكارت بناء على مساحة الشاشة
    final cardWidth = (screenWidth - 100) / 2;

    return Container(
      key: scrollController.projectsKey,
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SectionTitle(title: "My Projects"),
          const SizedBox(height: 75),
          Wrap(
            spacing: 40,
            runSpacing: 40,
            alignment: WrapAlignment.center,
            children: [
              SizedBox(
                width: cardWidth,
                child: ProjectCard(
                  title: Texts.ushopTitle,
                  subtitle: Texts.ushopSubtitle,
                  description: Texts.ushopDescription,
                  isMobile: true,
                  imageUrls: Texts.ushop,
                  githubUrl: Texts.ushopGithubUrl,
                  demoUrl: Texts.ushopVideoUrl,
                ),
              ),
              SizedBox(
                width: cardWidth,
                child: ProjectCard(
                  title: Texts.ushopDashboardTitle,
                  subtitle: Texts.ushopDashboardSubtitle,
                  description: Texts.ushopDashboardDescription,
                  isMobile: false,
                  imageUrls: Texts.ushopDashboard,
                  githubUrl: Texts.ushopDashboardGithubUrl,
                  demoUrl: Texts.ushopDashboardVideoUrl,
                ),
              ),
              SizedBox(
                width: cardWidth,
                child: ProjectCard(
                  title: Texts.pregnantMomTitle,
                  subtitle: Texts.pregnantMomSubtitle,
                  description: Texts.pregnantMomDescription,
                  isMobile: false,
                  imageUrls: Texts.pregnantMom,
                  githubUrl: Texts.pregnantMomGithubUrl,
                  demoUrl: Texts.pregnantMomVideoUrl,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
