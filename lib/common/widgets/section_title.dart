import 'package:flutter/material.dart';
import 'package:my_portfolio/helpers/helper_functions.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    bool isMobile = HelperFunctions.isMobile(context);
    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize: isMobile ? 40 : 60,
        fontFamily: "Montserrat",
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
