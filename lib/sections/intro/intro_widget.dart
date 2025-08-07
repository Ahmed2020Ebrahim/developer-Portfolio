import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/constantss/enums.dart';
import 'package:my_portfolio/helpers/helper_functions.dart';

import '../../common/widgets/animated_gradient_border_container.dart';
import '../../common/widgets/animated_gradient_text.dart';
import '../../controllers/app_scrolling_controller.dart';

class IntroWidget extends StatelessWidget {
  const IntroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = Get.find<AppScrollingController>();
    bool isMobile = HelperFunctions.isMobile(context);
    bool isTablet = HelperFunctions.isTablet(context);

    return Padding(
      padding: EdgeInsets.only(
        left:
            HelperFunctions.isDesktop(context)
                ? 80
                : isMobile
                ? 20
                : 40,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isMobile
              ? SizedBox(height: 0)
              : isTablet
              ? SizedBox(height: 40)
              : SizedBox(height: 100),
          AnimatedGradientBorderContainer(
            width: 380,
            height: 40,
            borderRadius: BorderRadius.circular(30),
            gradientColors: [Colors.white, Colors.blueGrey, Colors.white, Colors.blueGrey],
            duration: Duration(seconds: 3),
            revers: true,
            child: Container(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment:
                      isMobile ? MainAxisAlignment.spaceAround : MainAxisAlignment.start,
                  children: [
                    Icon(Icons.auto_awesome_outlined, color: Colors.white),
                    SizedBox(width: 10),

                    Text(
                      "Flutter Developer",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.normal,
                        letterSpacing: 3,
                        fontSize: isMobile ? 12 : 15,
                      ),
                    ),

                    VerticalDivider(color: Colors.white, thickness: 1, endIndent: 6, indent: 6),
                    Text(
                      "Apps & Web",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.normal,
                        letterSpacing: 3,
                        fontSize: isMobile ? 12 : 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: isMobile ? 50 : 12),
          AnimatedGradientText(
            text: "Ahmed Ebrahim",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: isMobile ? 40 : 80,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.bold,
            ),

            colors: [Colors.white, const Color.fromARGB(255, 92, 91, 91)],
            animate: false,
          ),
          SizedBox(
            width:
                HelperFunctions.isDesktop(context)
                    ? 600
                    : isTablet
                    ? 400
                    : MediaQuery.of(context).size.width - 100,
            child: Text(
              "Hi! I'm a Full Stack Developer specializing in creating websites, mobile apps, and robust software solutions.I will be happy if you explore my works",
              style: TextStyle(
                color: Color.fromRGBO(176, 182, 193, 1),
                fontSize: 18,
                fontFamily: "Montserrat",
              ),
            ),
          ),
          SizedBox(height: 40),
          OutlinedButton(
            onPressed: () {
              //to to contact section
              scrollController.scrollTo(Section.contact);
            },
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.transparent,
              side: BorderSide(color: Colors.white, width: 2),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            ),
            child: Text(
              "Let's Connect!",
              style: TextStyle(
                fontSize: 18,
                fontFamily: "Montserrat",
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
