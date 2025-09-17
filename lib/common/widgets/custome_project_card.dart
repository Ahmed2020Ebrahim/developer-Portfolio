import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/constantss/colors.dart';
import 'package:my_portfolio/controllers/project_card_controller.dart';
import 'package:my_portfolio/helpers/helper_functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomeProjectCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String performance;
  final String featuresNumber;
  final String frameworks;
  final List<String> technicalPoints;
  final List<String> images;
  final PageController pageController;
  final int currentImageIndex;
  final ProjectCardName projectCardName;
  final bool reverse;
  final String demoLink;
  final String githubLink;

  const CustomeProjectCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.performance,
    required this.featuresNumber,
    required this.frameworks,
    required this.technicalPoints,
    required this.images,
    required this.pageController,
    required this.currentImageIndex,
    required this.projectCardName,
    this.reverse = false,
    this.demoLink = "",
    this.githubLink = "",
  });

  @override
  Widget build(BuildContext context) {
    final ProjectCardController projectCardController = Get.find<ProjectCardController>();

    return Card(
      margin: EdgeInsets.symmetric(horizontal: HelperFunctions.isDesktop(context) ? 120 : 0),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.cardBackgroundColor),
      ),
      color: AppColors.cardBackgroundColor,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardBackgroundColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child:
            HelperFunctions.isMobile(context)
                ? Column(
                  children:
                      reverse
                          ? [
                            _buildRightImage(projectCardController, context),
                            _buildLeftContent(context),
                          ]
                          : [
                            _buildLeftContent(context),
                            _buildRightImage(projectCardController, context),
                          ],
                )
                : Row(
                  children:
                      reverse
                          ? [
                            Expanded(
                              flex: 1,
                              child: _buildRightImage(projectCardController, context),
                            ),
                            Expanded(flex: 1, child: _buildLeftContent(context)),
                          ]
                          : [
                            Expanded(flex: 1, child: _buildLeftContent(context)),
                            Expanded(
                              flex: 1,
                              child: _buildRightImage(projectCardController, context),
                            ),
                          ],
                ),
      ),
    );
  }

  Widget _buildLeftContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: HelperFunctions.isMobile(context) ? 30 : 0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 12),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white60),
          ),
          const SizedBox(height: 15),
          Text(
            "Performance Metrics",
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600, color: Colors.white),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildMetric("Performance", performance, Colors.white, context),
              _buildMetric("Number of features", featuresNumber, Colors.white, context),
              _buildMetric("Frameworks", frameworks, Colors.white, context),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            "Technical Implementation",
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600, color: Colors.white),
          ),
          const SizedBox(height: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
                technicalPoints
                    .map(
                      (point) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          children: [
                            const Icon(Icons.arrow_right, size: 20, color: Colors.white),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                point,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white60,
                                  height: 1.5,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
          ),
          const SizedBox(height: 20),
          //button for demo
          HelperFunctions.isMobile(context)
              ? Column(
                children: [
                  InkWell(
                    onTap: () async {
                      //launch demo link
                      if (demoLink.isNotEmpty) {
                        await HelperFunctions.launchTheUrl(demoLink);
                      }
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
                        "Demo",
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
                      //launch github link
                      if (githubLink.isNotEmpty) {
                        await HelperFunctions.launchTheUrl(githubLink);
                      }
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
                        "GitHub",
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
                children: [
                  InkWell(
                    onTap: () async {
                      print("demoLink: $demoLink");
                      //launch demo link
                      if (demoLink.isNotEmpty) {
                        await HelperFunctions.launchTheUrl(demoLink);
                      }
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
                        "Demo",
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
                      //launch github link
                      if (githubLink.isNotEmpty) {
                        await HelperFunctions.launchTheUrl(githubLink);
                      }
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
                        "GitHub",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          //button for github
        ],
      ),
    );
  }

  Widget _buildRightImage(ProjectCardController projectCardController, BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius:
              HelperFunctions.isMobile(context)
                  ? BorderRadius.only(
                    topRight: Radius.circular(reverse ? 16 : 0),
                    topLeft: Radius.circular(reverse ? 16 : 0),
                    bottomRight: Radius.circular(reverse ? 0 : 16),
                    bottomLeft: Radius.circular(reverse ? 0 : 16),
                  )
                  : BorderRadius.only(
                    topRight: Radius.circular(reverse ? 0 : 16),
                    bottomRight: Radius.circular(reverse ? 0 : 16),
                    topLeft: Radius.circular(reverse ? 16 : 0),
                    bottomLeft: Radius.circular(reverse ? 16 : 0),
                  ),
          child: Container(
            height: 500,
            color: Colors.white,
            child: Container(
              margin: EdgeInsets.fromLTRB(25, 25, 25, 55),
              decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.7),
                    blurRadius: 15,
                    offset: const Offset(3, 7),
                  ),
                ],
              ),
              child: PageView(
                controller: pageController,
                onPageChanged: (value) {
                  projectCardController.indecatorScrolle(value, projectCardName);
                },
                children: List.generate(
                  images.length,
                  (index) => Image.asset(images[index], fit: BoxFit.fill),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          child: SmoothPageIndicator(
            controller: pageController,
            onDotClicked: (index) {
              projectCardController.onDotClicked(index, projectCardName);
            },
            count: images.length,
            effect: SlideEffect(
              activeDotColor: Colors.black,
              dotColor: Colors.grey,
              dotHeight: 12,
              dotWidth: 12,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMetric(String label, String value, Color color, BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: HelperFunctions.isMobile(context) ? 12 : 20,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: HelperFunctions.isMobile(context) ? 10 : 12,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
