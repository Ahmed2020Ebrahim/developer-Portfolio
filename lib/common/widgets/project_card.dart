import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../helpers/helper_functions.dart';

class ProjectCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String description;
  final bool isMobile;
  final List<String> imageUrls;
  final String githubUrl;
  final String demoUrl;

  const ProjectCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.isMobile,
    required this.imageUrls,
    required this.githubUrl,
    required this.demoUrl,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  late PageController _pageController;
  int currentPage = 0;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = widget.isMobile;
    final List<String> imageUrls = widget.imageUrls;

    final double cardHeight = 600;
    final BorderRadius borderRadius = BorderRadius.circular(20);
    bool isMobilescreen = HelperFunctions.isMobile(context);

    return Container(
      height: cardHeight,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: borderRadius,
        border: Border.all(color: Colors.white, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Images section
          SizedBox(
            height: isMobile ? 250 : 250,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) => setState(() => currentPage = index),
              itemCount:
                  (isMobile && imageUrls.length > 1) ? (imageUrls.length - 1) : imageUrls.length,
              itemBuilder: (context, index) {
                if (isMobile && imageUrls.length >= 2) {
                  int screenLength = isMobilescreen ? 2 : 3;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      for (int i = 0; i < screenLength; i++)
                        if (index + i < imageUrls.length)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              imageUrls[index + i],
                              width: 120,
                              height: 250,
                              fit: BoxFit.fill,
                            ),
                          ),
                    ],
                  );
                } else {
                  return Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        imageUrls[index],
                        width: isMobile ? 120 : 400,
                        height: isMobile ? 250 : 250,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                }
              },
            ),
          ),

          const SizedBox(height: 10),

          // Dot indicator
          if (imageUrls.length > (isMobile ? 2 : 1))
            Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count:
                    (isMobile && imageUrls.length > 1) ? (imageUrls.length - 1) : imageUrls.length,
                effect: WormEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  activeDotColor: Colors.black,
                  dotColor: Colors.white,
                ),
                onDotClicked: (index) {
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),

          const SizedBox(height: 10),

          // Title
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: "Montserrat",
            ),
          ),

          const SizedBox(height: 10),

          const Divider(color: Colors.white, thickness: 2, indent: 20, endIndent: 20),

          const SizedBox(height: 10),

          // Subtitle
          SizedBox(
            height: 40,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Text(
                widget.subtitle,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: isMobilescreen ? 0.6 : 0.4),
                  fontSize: 14,
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // Description
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: isMobilescreen ? 10 : 4),
              child: Text(
                widget.description,
                textAlign: TextAlign.left,
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // Buttons
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {
                    HelperFunctions.launchTheUrl(widget.githubUrl);
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.white),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  child: const Text("GitHub", style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(width: 10),
                OutlinedButton(
                  onPressed: () {
                    HelperFunctions.launchTheUrl(widget.demoUrl);
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.white),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  child: const Text("Demo", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
