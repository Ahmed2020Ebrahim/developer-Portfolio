import 'package:flutter/material.dart';

class EducationSubTitle extends StatelessWidget {
  const EducationSubTitle({super.key, required this.icon, required this.title});
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.white, size: 30),
        SizedBox(width: 10),
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w300,
            fontFamily: "Montserrat",
          ),
        ),
      ],
    );
  }
}
