import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelperFunctions {
  //hex to color
  static Color hexToColor(String hex) {
    hex = hex.replaceAll('#', '');
    if (hex.length == 6) {
      hex = 'FF$hex'; // Add full opacity if not specified
    }
    return Color(int.parse(hex, radix: 16));
  }

  //is desktop
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1366;
  }

  //is tablet
  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width < 1366 && MediaQuery.of(context).size.width >= 768;
  }

  //is mobile
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 768;
  }

  //lunch url
  static Future<void> launchTheUrl(String url) async {
    final Uri parsedUrl = Uri.parse(url);
    if (!await launchUrl(parsedUrl, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}
