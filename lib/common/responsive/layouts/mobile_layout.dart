import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/common/responsive/appbar_layouts/appbar_mobil.dart';

import '../../../constantss/colors.dart';
import '../../../constantss/enums.dart';
import '../../../controllers/app_scrolling_controller.dart';
import '../../widgets/light_halo.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key, required this.body});
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    //scrollingController instace
    final scrollController = Get.find<AppScrollingController>();

    return Scaffold(
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.5,
        backgroundColor: AppColors.black.withValues(alpha: 0.5),
        child: Obx(
          () => Column(
            children: [
              SizedBox(height: 50), // Spacing at the top
              ListTile(
                title: Text(
                  "About Me",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight:
                        scrollController.isCurrentSection(Section.about)
                            ? FontWeight.w700
                            : FontWeight.w400,
                    fontFamily: "Montserrat",
                  ),
                ),
                titleAlignment: ListTileTitleAlignment.center,
                onTap: () {
                  Get.back(); // Close the drawer
                  scrollController.scrollTo(Section.about);
                },
              ),

              //divider
              ListTile(
                title: Text(
                  "Skills",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight:
                        scrollController.isCurrentSection(Section.skills)
                            ? FontWeight.w700
                            : FontWeight.w400,
                    fontFamily: "Montserrat",
                  ),
                ),
                titleAlignment: ListTileTitleAlignment.center,
                onTap: () {
                  Get.back(); // Close the drawer
                  scrollController.scrollTo(Section.skills);
                },
              ),
              //divider
              ListTile(
                title: Text(
                  "Services",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight:
                        scrollController.isCurrentSection(Section.services)
                            ? FontWeight.w700
                            : FontWeight.w400,
                    fontFamily: "Montserrat",
                  ),
                ),
                titleAlignment: ListTileTitleAlignment.center,
                onTap: () {
                  Get.back(); // Close the drawer
                  scrollController.scrollTo(Section.services);
                },
              ),

              //divider
              ListTile(
                title: Text(
                  "Projects",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight:
                        scrollController.isCurrentSection(Section.projects)
                            ? FontWeight.w700
                            : FontWeight.w400,
                    fontFamily: "Montserrat",
                  ),
                ),
                titleAlignment: ListTileTitleAlignment.center,
                onTap: () {
                  Get.back(); // Close the drawer
                  scrollController.scrollTo(Section.projects);
                },
              ),

              //divider
              ListTile(
                title: Text(
                  "Education",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight:
                        scrollController.isCurrentSection(Section.education)
                            ? FontWeight.w700
                            : FontWeight.w400,
                    fontFamily: "Montserrat",
                  ),
                ),
                onTap: () {
                  Get.back(); // Close the drawer
                  scrollController.scrollTo(Section.education);
                },
              ),

              //divider
              ListTile(
                title: Text(
                  "Contact",

                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight:
                        scrollController.isCurrentSection(Section.contact)
                            ? FontWeight.w700
                            : FontWeight.w400,
                    fontFamily: "Montserrat",
                  ),
                ),
                onTap: () {
                  Get.back(); // Close the drawer
                  scrollController.scrollTo(Section.contact);
                },
              ),

              //divider
            ],
          ),
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          // Gradient halo at top left
          LightHalo(top: -300, left: -200),
          // Gradient halo at bottom right
          LightHalo(bottom: -250, right: -200),
          // Main content
          Column(
            children: [
              //custom app bar or navigation
              AppbarMobil(),

              // Add your Section here, using the keys from AppScrollingController
              //the body according to the platform
              Expanded(child: body ?? const SizedBox()),
            ],
          ),
        ],
      ),
    );
  }
}
