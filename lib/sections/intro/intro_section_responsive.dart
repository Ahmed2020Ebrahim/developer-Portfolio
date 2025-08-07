import 'package:flutter/material.dart';

import 'intro_widget.dart';

class IntroSectionResponsive extends StatelessWidget {
  const IntroSectionResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //intro section
          IntroWidget(),
        ],
      ),
    );
  }
}
