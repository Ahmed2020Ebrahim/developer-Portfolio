import 'package:flutter/material.dart';

import '../../../constantss/colors.dart';
import '../../widgets/light_halo.dart';
import '../appbar_layouts/appbar_desktop.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key, required this.body});
  final Widget? body;

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
          // Main content
          Column(
            children: [
              //custom app bar or navigation
              AppbarDesktop(),

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
