import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constantss/colors.dart';
import '../../../constantss/enums.dart';
import '../../../controllers/app_scrolling_controller.dart';

class AppbarTablet extends StatelessWidget {
  const AppbarTablet({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = Get.find<AppScrollingController>();
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 5,
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => scrollController.scrollTo(Section.about),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "About Me",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 21,
                          fontWeight:
                              scrollController.isCurrentSection(Section.about)
                                  ? FontWeight.w300
                                  : FontWeight.w200,
                          fontFamily: "Montserrat",
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => scrollController.scrollTo(Section.skills),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "Skills",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 21,
                          fontWeight:
                              scrollController.isCurrentSection(Section.skills)
                                  ? FontWeight.w300
                                  : FontWeight.w200,
                          fontFamily: "Montserrat",
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => scrollController.scrollTo(Section.services),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "Services",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 21,
                          fontWeight:
                              scrollController.isCurrentSection(Section.services)
                                  ? FontWeight.w300
                                  : FontWeight.w200,
                          fontFamily: "Montserrat",
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => scrollController.scrollTo(Section.projects),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Projects",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 21,
                          fontWeight:
                              scrollController.isCurrentSection(Section.projects)
                                  ? FontWeight.w300
                                  : FontWeight.w200,
                          fontFamily: "Montserrat",
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => scrollController.scrollTo(Section.education),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Education",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 21,
                          fontWeight:
                              scrollController.isCurrentSection(Section.education)
                                  ? FontWeight.w300
                                  : FontWeight.w200,
                          fontFamily: "Montserrat",
                        ),
                      ),
                    ),
                  ),

                  TextButton(
                    onPressed: () => scrollController.scrollTo(Section.contact),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Contact",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 21,
                          fontWeight:
                              scrollController.isCurrentSection(Section.contact)
                                  ? FontWeight.w300
                                  : FontWeight.w200,
                          fontFamily: "Montserrat",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
