import 'package:flutter/material.dart';

import '../../controllers/project_card_controller.dart';
import 'custome_project_card.dart';

class ResponsiveCustomProjectCard extends StatelessWidget {
  const ResponsiveCustomProjectCard({
    super.key,
    required this.projectCardController,
    required this.projectCardName,
    required this.currentImageIndex,
    required this.pageController,
    required this.title,
    required this.subtitle,
    required this.performance,
    required this.featuresNumber,
    required this.frameworks,
    required this.technicalPoints,
    required this.images,
    this.reverse = false,
    this.demoLink = "",
    this.githubLink = "",
  });

  final ProjectCardController projectCardController;
  final ProjectCardName projectCardName;
  final int currentImageIndex;
  final PageController pageController;
  final String title;
  final String subtitle;
  final String performance;
  final String featuresNumber;
  final String frameworks;
  final List<String> technicalPoints;
  final List<String> images;
  final bool reverse;
  final String demoLink;
  final String githubLink;

  @override
  Widget build(BuildContext context) {
    return CustomeProjectCard(
      title: title,
      subtitle: subtitle,
      performance: performance,
      featuresNumber: featuresNumber,
      frameworks: frameworks,
      technicalPoints: technicalPoints,
      images: images,
      pageController: pageController,
      currentImageIndex: currentImageIndex,
      projectCardName: projectCardName,
      reverse: reverse,
      demoLink: demoLink,
      githubLink: githubLink,
    );
  }
}
