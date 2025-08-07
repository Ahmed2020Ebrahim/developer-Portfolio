import 'package:flutter/material.dart';
import 'package:my_portfolio/common/responsive/appbar_layouts/appbar_tablet.dart';

import '../../../constantss/colors.dart';
import '../../widgets/light_halo.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key, required this.body});
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          // Gradient halo at top left
          LightHalo(top: -300, left: -300),
          // Gradient halo at bottom right
          LightHalo(bottom: -250, right: -500),
          // Main content
          Column(
            children: [
              //custom app bar or navigation
              AppbarTablet(),

              // Add your Section here, using the keys from AppScrollingController
              //the body according to the platform
              Expanded(child: body ?? const SizedBox()),
            ],
          ),
        ],
      ),
    );
  }
}
