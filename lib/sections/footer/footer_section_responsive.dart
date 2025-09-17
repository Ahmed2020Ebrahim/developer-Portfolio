import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:my_portfolio/constantss/enums.dart';
import 'package:my_portfolio/constantss/texts.dart';
import 'package:my_portfolio/controllers/app_scrolling_controller.dart';
import 'package:my_portfolio/helpers/helper_functions.dart';
import 'dart:html' as html;

import '../../constantss/colors.dart';

class FooterSectionResponsive extends StatelessWidget {
  const FooterSectionResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = HelperFunctions.isMobile(context);
    final AppScrollingController appScrollingController = Get.find<AppScrollingController>();

    return Container(
      padding: EdgeInsets.symmetric(vertical: isMobile ? 70 : 105, horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.cardBackgroundColor, // Dark background
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Let's Build Something Amazing",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          const Text(
            "Looking for a developer who can create high-performance, interactive web experiences?",
            style: TextStyle(fontSize: 16, color: Colors.white70),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          isMobile
              ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      appScrollingController.scrollTo(Section.contact);
                    },
                    child: Container(
                      width: 140,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.7),
                            blurRadius: 15,
                            offset: const Offset(3, 7),
                          ),
                        ],
                      ),
                      child: Text(
                        "Get In Touch",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () async {
                      //launch cv link
                      await HelperFunctions.launchTheUrl(Texts.cv);
                    },
                    child: Container(
                      width: 140,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.cardBackgroundColor,
                        border: Border.all(color: Colors.white, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.7),
                            blurRadius: 15,
                            offset: const Offset(3, 7),
                          ),
                        ],
                      ),
                      child: Text(
                        "View Resume",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              )
              : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      appScrollingController.scrollTo(Section.contact);
                    },

                    child: Container(
                      width: 140,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.7),
                            blurRadius: 15,
                            offset: const Offset(3, 7),
                          ),
                        ],
                      ),
                      child: Text(
                        "Get In Touch",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  InkWell(
                    onTap: () async {
                      //launch cv link
                      await HelperFunctions.launchTheUrl(Texts.cv);
                    },
                    child: Container(
                      width: 140,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.cardBackgroundColor,
                        border: Border.all(color: Colors.white, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.7),
                            blurRadius: 15,
                            offset: const Offset(3, 7),
                          ),
                        ],
                      ),
                      child: Text(
                        "View Resume",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                  //launch github link
                  await HelperFunctions.launchTheUrl(Texts.linkedIn);
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/svg/linkedin.svg",
                    width: 30,
                    height: 30,
                    placeholderBuilder: (context) => CircularProgressIndicator(),
                    colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                ),
              ),
              SizedBox(width: 20),
              InkWell(
                onTap: () async {
                  //launch github link
                  await HelperFunctions.launchTheUrl(Texts.github);
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/svg/github.svg",
                    width: 30,
                    height: 30,
                    placeholderBuilder: (context) => CircularProgressIndicator(),
                    colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                ),
              ),
              SizedBox(width: 20),
              InkWell(
                onTap: () async {
                  final gmailUrl =
                      "https://mail.google.com/mail/?view=cm&fs=1&to=ahibrahime8@gmail.com";
                  html.window.open(gmailUrl, "_blank"); // opens in a new tab
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.email, color: Colors.white, size: 30),
                ),
              ),
              SizedBox(width: 20),
              InkWell(
                onTap: () async {
                  final String phoneNumber = "201030287583"; // your number in international format
                  final String message = "Hello! I would like to contact you.";
                  final encodedMessage = Uri.encodeComponent(message);
                  final whatsappUrl = "https://wa.me/$phoneNumber?text=$encodedMessage";
                  html.window.open(whatsappUrl, "_blank");
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset(
                    "assets/icons/whatsapp.png",
                    color: Colors.white,
                    width: 30,
                    height: 30,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          isMobile
              ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    " Welcome to the place where everything is crafted with passion, precision, and love ",
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Iconsax.heart, color: Colors.white, size: 20),
                      SizedBox(width: 10),
                      Icon(Iconsax.heart, color: Colors.white, size: 20),
                    ],
                  ),
                ],
              )
              : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Iconsax.heart, color: Colors.white, size: 20),
                  Text(
                    " Welcome to the place where everything is crafted with passion, precision, and love ",
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),

                  Icon(Iconsax.heart, color: Colors.white, size: 20),
                ],
              ),
        ],
      ),
    );
  }
}
