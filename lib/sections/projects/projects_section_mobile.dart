import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/widgets/project_card.dart';
import '../../common/widgets/section_title.dart';
import '../../constantss/texts.dart';
import '../../controllers/app_scrolling_controller.dart';

class ProjectsSectionMobile extends StatelessWidget {
  const ProjectsSectionMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = Get.find<AppScrollingController>();
    return Container(
      key: scrollController.projectsKey,
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          SectionTitle(title: "My Projects"),
          //space
          SizedBox(height: 75),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProjectCard(
                title: Texts.ushopTitle,
                subtitle: Texts.ushopSubtitle,
                description: Texts.ushopDescription,
                isMobile: true,
                imageUrls: Texts.ushop,
                githubUrl: Texts.ushopGithubUrl,
                demoUrl: Texts.ushopVideoUrl,
              ),
              SizedBox(height: 40),
              ProjectCard(
                title: Texts.ushopDashboardTitle,
                subtitle: Texts.ushopDashboardSubtitle,
                description: Texts.ushopDashboardDescription,
                isMobile: false,
                imageUrls: Texts.ushopDashboard,
                githubUrl: Texts.ushopDashboardGithubUrl,
                demoUrl: Texts.ushopDashboardVideoUrl,
              ),
              SizedBox(height: 40),
              ProjectCard(
                title: Texts.pregnantMomTitle,
                subtitle: Texts.pregnantMomSubtitle,
                description: Texts.pregnantMomDescription,
                isMobile: false,
                imageUrls: Texts.pregnantMom,
                githubUrl: Texts.pregnantMomGithubUrl,
                demoUrl: Texts.pregnantMomVideoUrl,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
