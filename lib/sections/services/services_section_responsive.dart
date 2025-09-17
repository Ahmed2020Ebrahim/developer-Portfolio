import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../common/widgets/section_title.dart';
import '../../common/widgets/services_card.dart';
import '../../controllers/app_scrolling_controller.dart';
import '../../controllers/service_card_controller.dart';

class ServicesSectionResponsive extends StatelessWidget {
  const ServicesSectionResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = Get.find<AppScrollingController>();
    final serviceCardController = Get.find<ServiceCardController>();
    return Obx(
      key: scrollController.servicesKey,
      () => Container(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SectionTitle(title: "Popular Services"),
            SizedBox(height: 25),
            SizedBox(
              child: Column(
                children: [
                  Text.rich(
                    textAlign: TextAlign.center,

                    TextSpan(
                      children: [
                        TextSpan(
                          text: '"',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        TextSpan(
                          text:
                              "  dream until your dreams come true , and here is where Your ideas come to life ",
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white54),
                        ),
                        TextSpan(
                          text: '"',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    onTap: () {
                      serviceCardController.selectAppService();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 140,
                      height: 40,
                      decoration: BoxDecoration(
                        color:
                            serviceCardController.isAppServiceSelected.value
                                ? Colors.black
                                : Colors.white,
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Apps Services",
                        style: TextStyle(
                          color:
                              serviceCardController.isAppServiceSelected.value
                                  ? Colors.white
                                  : Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    onTap: () {
                      serviceCardController.selectWebService();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 140,
                      height: 40,
                      decoration: BoxDecoration(
                        color:
                            serviceCardController.isAppServiceSelected.value
                                ? Colors.white
                                : Colors.black,
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Web Services",
                        style: TextStyle(
                          color:
                              serviceCardController.isAppServiceSelected.value
                                  ? Colors.black
                                  : Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 35),

            Wrap(
              spacing: 30,
              runSpacing: 30,
              alignment: WrapAlignment.center,
              children:
                  serviceCardController.isAppServiceSelected.value
                      ? [
                        //
                        //
                        ServiceCard(
                          icon: Icons.app_shortcut_outlined,
                          title: "Custom App Development",
                          description:
                              "Bespoke mobile and web applications tailored to your needs, delivering seamless performance, intuitive design, and powerful functionality",
                        ),
                        ServiceCard(
                          icon: Icons.shopping_cart_outlined,
                          title: "E-commerce Development",
                          description:
                              "Custom online stores built for performance, security, and user experience , helping you sell more and manage your business with ease.",
                        ),
                        ServiceCard(
                          icon: Icons.settings_suggest_outlined,
                          title: "Maintenance & Updates",
                          description:
                              "We make sure your site or app stays fresh, secure, and running smoothly , so you can focus on your business.",
                        ),
                      ]
                      : [
                        ServiceCard(
                          icon: Iconsax.code_1_copy,
                          title: "Custom Website",
                          description:
                              "Tailored, responsive websites built to match your brand, engage your audience, and deliver a seamless user experience.",
                        ),
                        ServiceCard(
                          icon: Iconsax.chart_1,
                          title: "Admin Dashboards",
                          description:
                              "Powerful, intuitive admin dashboards designed to manage data, track performance, and streamline operations with ease.",
                        ),
                        ServiceCard(
                          icon: Icons.color_lens_outlined,
                          title: "Personal Portfolio",
                          description:
                              "Beautiful, personalized portfolio websites designed to showcase your skills, projects, and achievements in a professional way.",
                        ),
                      ],
            ),
          ],
        ),
      ),
    );
  }
}
