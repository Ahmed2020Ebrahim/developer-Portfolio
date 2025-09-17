import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_portfolio/constantss/colors.dart';

import '../../pages/portfolio_page_desktop.dart';
import '../../pages/portfolio_page_mobile.dart';
import '../../pages/portfolio_page_tablet.dart';
import '../responsive/templates/site_template.dart';
import '../widgets/light_halo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1))
      ..repeat(reverse: true);

    _scaleAnimation = Tween<double>(
      begin: 0.75,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

    Timer(const Duration(seconds: 4), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder:
                (_) => SiteTemplate(
                  // desktop layout
                  desktopLayoutBody: PortfolioPageDesktop(),

                  // tablet layout
                  tabletLayoutBody: PortfolioPageTablet(),

                  // mobile layout
                  mobileLayoutBody: PortfolioPageMobile(),
                ),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          // Gradient halo at top left
          LightHalo(top: -300, left: -200),
          // Gradient halo at bottom right
          LightHalo(bottom: -250, right: -600),
          Center(
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Image.asset('assets/logos/my_logo.png', width: 70, height: 70),
            ),
          ),
        ],
      ),
    );
  }
}
