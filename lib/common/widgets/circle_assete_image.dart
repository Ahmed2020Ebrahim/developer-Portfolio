import 'package:flutter/material.dart';

class CircleAssetImage extends StatelessWidget {
  final String imagePath;
  final double radius;
  final Color? borderColor;
  final double borderWidth;

  const CircleAssetImage({
    super.key,
    required this.imagePath,
    this.radius = 50,
    this.borderColor,
    this.borderWidth = 0,
  });

  @override
  Widget build(BuildContext context) {
    double size = radius * 2;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: borderColor ?? Colors.transparent, width: borderWidth),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Image.asset(imagePath, width: size, height: size, fit: BoxFit.scaleDown),
      ),
    );
  }
}
