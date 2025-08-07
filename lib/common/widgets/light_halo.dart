import 'package:flutter/material.dart';

import '../../constantss/colors.dart';

class LightHalo extends StatelessWidget {
  const LightHalo({super.key, this.top, this.left, this.right, this.bottom});
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 0.8,
            colors: [
              Color.fromRGBO(255, 255, 255, 0.15), // 0%
              Color.fromRGBO(255, 255, 255, 0.13),
              Color.fromRGBO(255, 255, 255, 0.10),
              Color.fromRGBO(255, 255, 255, 0.07),
              Color.fromRGBO(255, 255, 255, 0.04),
              AppColors.backgroundColor.withValues(alpha: 0.004),
              AppColors.backgroundColor.withValues(alpha: 0.003),
              AppColors.backgroundColor.withValues(alpha: 0.002),
              AppColors.backgroundColor.withValues(alpha: 0.001),
              Colors.transparent,
            ],
            stops: [0.0, 0.1, 0.2, 0.3, 0.4, 0.55, 0.7, 0.8, 0.9, 1.0],
          ),
        ),
      ),
    );
  }
}
