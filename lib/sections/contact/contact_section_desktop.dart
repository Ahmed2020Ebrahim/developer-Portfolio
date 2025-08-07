import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/common/widgets/section_title.dart';
import 'package:my_portfolio/constantss/texts.dart';
import 'package:my_portfolio/controllers/sending_email_controller.dart';
import 'package:my_portfolio/helpers/helper_functions.dart';

import '../../common/widgets/infot_tile.dart';
import '../../controllers/app_scrolling_controller.dart';

class ContactSectionDesktop extends StatelessWidget {
  const ContactSectionDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = Get.put(AppScrollingController());
    final SendingEmailController sendingEmailController = Get.find<SendingEmailController>();

    return Container(
      key: scrollController.contactKey,
      color: Colors.transparent,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Center(child: SectionTitle(title: "Contact Me")),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Left Form Section
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 80),
                  alignment: Alignment.center,
                  child: Card(
                    color: Colors.transparent,
                    shadowColor: Colors.transparent,
                    surfaceTintColor: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Form(
                        key: sendingEmailController.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("GET IN TOUCH", style: TextStyle(color: Colors.grey)),
                            const SizedBox(height: 8),
                            const Text(
                              "Let's Discuss Projects",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              "Get in touch with us for any kind of help. We are here to give you the best and also here to help you to find your projects.",
                              style: TextStyle(color: Colors.white),
                            ),
                            const SizedBox(height: 24),

                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    validator: sendingEmailController.validateName,
                                    controller: sendingEmailController.nameController,
                                    decoration: InputDecoration(
                                      labelStyle: TextStyle(color: Colors.white),
                                      labelText: "Name *",
                                      fillColor: Colors.white30,
                                      filled: true,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: TextFormField(
                                    validator: sendingEmailController.validateEmail,
                                    controller: sendingEmailController.emailController,
                                    decoration: InputDecoration(
                                      labelStyle: TextStyle(color: Colors.white),
                                      labelText: "Email *",
                                      fillColor: Colors.white30,
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 16),
                            TextFormField(
                              validator: sendingEmailController.validateSubject,
                              controller: sendingEmailController.subjectController,
                              decoration: InputDecoration(
                                labelStyle: TextStyle(color: Colors.white),
                                labelText: "Subject *",
                                fillColor: Colors.white30,
                                filled: true,
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              validator: sendingEmailController.validateMessage,
                              controller: sendingEmailController.messageController,
                              maxLines: 4,
                              decoration: InputDecoration(
                                labelStyle: TextStyle(color: Colors.white),
                                labelText: "Your message *",
                                fillColor: Colors.white30,
                                filled: true,
                              ),
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                              onPressed: () async {
                                await sendingEmailController.sendEmail();
                              },
                              child: const Text(
                                "Send Message",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 32, height: 32),

              // Right Contact Info + Map
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Let's Discuss Your Project",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 24),

                    InfoTile(
                      icon: Icon(Icons.phone, size: 20, color: Colors.white),
                      title: "Phone",
                      subtitle: Texts.phoneNumber,
                    ),
                    const SizedBox(height: 16),
                    InfoTile(
                      icon: Icon(Icons.mail, size: 20, color: Colors.white),
                      title: "Mail",
                      subtitle: Texts.mail,
                    ),
                    const SizedBox(height: 16),
                    InfoTile(
                      icon: Icon(Icons.location_on, size: 20, color: Colors.white),
                      title: "Address",
                      subtitle: Texts.address,
                    ),
                    const SizedBox(height: 16),
                    InkWell(
                      onTap: () async {
                        await HelperFunctions.launchTheUrl(Texts.linkedIn);
                      },
                      child: InfoTile(
                        icon: SvgPicture.asset(
                          "assets/icons/svg/linkedin.svg",
                          width: 20,
                          height: 20,
                          placeholderBuilder: (context) => CircularProgressIndicator(),
                          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                        ),
                        title: "LinkedIn",
                        subtitle: "Visit me on LinkedIn\nAhmed Ebrahime | LinkedIn",
                      ),
                    ),
                    const SizedBox(height: 16),
                    InkWell(
                      onTap: () async {
                        await HelperFunctions.launchTheUrl(Texts.github);
                      },
                      child: InfoTile(
                        icon: SvgPicture.asset(
                          "assets/icons/svg/github.svg",
                          width: 20,
                          height: 20,
                          placeholderBuilder: (context) => CircularProgressIndicator(),
                          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                        ),
                        title: "GitHub",
                        subtitle: "Visit me on GitHub\nAhmed Ebrahime | GitHub",
                      ),
                    ),
                    const SizedBox(height: 16),
                    InkWell(
                      onTap: () async {
                        await HelperFunctions.launchTheUrl(Texts.cv);
                      },
                      child: InfoTile(
                        icon: Icon(Icons.picture_as_pdf, size: 20, color: Colors.white),
                        title: "My CV",
                        subtitle: "Download and read my resume",
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
