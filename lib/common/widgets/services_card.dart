import 'package:flutter/material.dart';

import '../../constantss/colors.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });
  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      alignment: Alignment.center,
      width: 360,
      height: 420,
      decoration: BoxDecoration(
        color: AppColors.cardBackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 65,
            backgroundColor: const Color.fromARGB(255, 25, 27, 28),
            child: Icon(icon, color: Colors.white, size: 65),
          ),
          SizedBox(height: 40),
          //title
          Text(title, style: TextStyle(color: Colors.white, fontSize: 20)),
          SizedBox(height: 30),
          //description
          Text(description, style: TextStyle(color: Colors.white54), textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
