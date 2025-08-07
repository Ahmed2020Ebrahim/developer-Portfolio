import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../common/widgets/education_subtitle.dart';
import '../../common/widgets/section_title.dart';
import '../../controllers/app_scrolling_controller.dart';

class EducationSectionDesktop extends StatelessWidget {
  const EducationSectionDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = Get.find<AppScrollingController>();
    return Container(
      key: scrollController.educationKey,
      color: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                SizedBox(
                  height: 600,
                  width: 550,
                  child: Image.asset("assets/images/graduation.jpg", fit: BoxFit.cover),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionTitle(title: "My Education"),
                SizedBox(height: 40),
                Text(
                  "Bachelor in Computer Science",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Montserrat",
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 50),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/icons/university.png",
                            height: 30,
                            width: 30,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Mansoura University, Mansoura, Egypt",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                              fontFamily: "Montserrat",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      EducationSubTitle(icon: Iconsax.calendar_1, title: "2017 - 2021"),
                      SizedBox(height: 20),
                      EducationSubTitle(icon: Icons.bar_chart_outlined, title: "GPA: 3.2 / 4.0"),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  "Relevant Courses",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Montserrat",
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 50),
                  child: Column(
                    children: [
                      EducationSubTitle(icon: Iconsax.chart_1, title: "Data Structures"),
                      SizedBox(height: 20),
                      EducationSubTitle(icon: Icons.psychology, title: "Algorithms"),
                      SizedBox(height: 20),
                      EducationSubTitle(icon: Icons.build, title: "Software Engineering"),
                      SizedBox(height: 20),
                      EducationSubTitle(icon: Icons.sort, title: "Database Systems"),
                      SizedBox(height: 20),
                      EducationSubTitle(icon: Icons.language, title: "Web Development"),
                      SizedBox(height: 20),
                      EducationSubTitle(icon: Icons.smartphone, title: "Mobile App Development"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
