import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/helpers/helper_functions.dart';

import '../../common/widgets/responsive_custom_project_card.dart';
import '../../common/widgets/section_title.dart';
import '../../constantss/texts.dart';
import '../../controllers/app_scrolling_controller.dart';
import '../../controllers/project_card_controller.dart';

class ProjectSectionResponsive extends StatelessWidget {
  const ProjectSectionResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = Get.find<AppScrollingController>();
    final ProjectCardController projectCardController = Get.find<ProjectCardController>();
    return Obx(
      () => Container(
        key: scrollController.projectsKey,
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            SectionTitle(title: "My Projects"),
            SizedBox(height: 75),
            //
            //
            //ushop app
            ResponsiveCustomProjectCard(
              projectCardController: projectCardController,
              projectCardName: ProjectCardName.ushop,
              currentImageIndex: projectCardController.uShopCurrentPage.value,
              pageController: projectCardController.uShopPageViewController,
              title: "U-Shop",
              subtitle: "Scalable mobile platform for modern shopping",
              performance: "98 %",
              featuresNumber: "+ 16",
              frameworks: "Flutter",
              technicalPoints: Texts.ushopTechPointsList,
              images: Texts.ushopImages,
              reverse: HelperFunctions.isMobile(context) ? true : false,
              demoLink: Texts.ushopVideoUrl,
              githubLink: Texts.ushopGithubUrl,
            ),
            SizedBox(height: 80),
            //
            //
            //HowToDo app
            ResponsiveCustomProjectCard(
              projectCardController: projectCardController,
              projectCardName: ProjectCardName.howTodo,
              currentImageIndex: projectCardController.howToDoCurrentPage.value,
              pageController: projectCardController.howToDoPageViewController,
              title: "HowToDo",
              subtitle: "Your Simple & Smart To-Do App",
              performance: "98 %",
              featuresNumber: "+ 11",
              frameworks: "Flutter",
              technicalPoints: Texts.howTodoTechPointsList,
              images: Texts.howTodoImages,
              reverse: true,
              demoLink: "",
              githubLink: Texts.howTodoGithubUrl,
            ),
            SizedBox(height: 80),
            //
            //
            //ushop dashboard
            ResponsiveCustomProjectCard(
              projectCardController: projectCardController,
              projectCardName: ProjectCardName.ushopDashboard,
              currentImageIndex: projectCardController.ushopDashboardCurrentPage.value,
              pageController: projectCardController.ushopDashboardPageViewController,
              title: "U-Shop Dashboard",
              subtitle: "A Complete Dashboard Solution for Managing E-Commerce Efficiently",
              performance: "97 %",
              featuresNumber: "+ 14",
              frameworks: "Flutter",
              technicalPoints: Texts.ushopDashboardTechPointsList,
              images: Texts.ushopDashboardImages,
              reverse: HelperFunctions.isMobile(context) ? true : false,
              demoLink: Texts.ushopDashboardVideoUrl,
              githubLink: Texts.ushopDashboardGithubUrl,
            ),
            SizedBox(height: 80),
            //
            //
            //pregnant mom
            ResponsiveCustomProjectCard(
              projectCardController: projectCardController,
              projectCardName: ProjectCardName.pregnantMom,
              currentImageIndex: projectCardController.pregnantMomCurrentPage.value,
              pageController: projectCardController.pregnantMomPageViewController,
              title: "Pregnant Mom",
              subtitle:
                  "A supportive web app designed to guide and assist expectant mothers through every stage of pregnancy.",
              performance: "98 %",
              featuresNumber: "+ 12",
              frameworks: "PHP Native",
              technicalPoints: Texts.pregnantMomTechPointsList,
              images: Texts.pregnantMomImages,
              reverse: true,
              demoLink: Texts.pregnantMomVideoUrl,
              githubLink: Texts.pregnantMomGithubUrl,
            ),
          ],
        ),
      ),
    );
  }
}
