import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/bindings/inti_bindings.dart';
import 'package:my_portfolio/common/responsive/layouts/desktop_layout.dart';
import 'package:my_portfolio/common/responsive/templates/site_template.dart';
import 'package:my_portfolio/common/splash/splash_screen.dart';

import 'package:web/web.dart' as web;

import 'common/widgets/light_halo.dart';
import 'constantss/colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    web.document.title = "Ahmed Ebrahim";

    // app entry point
    return GetMaterialApp(
      // init bindings { AppScrollingController & SendingEmailController }
      initialBinding: InitialBindings(),

      // don't show debugModeBanner
      debugShowCheckedModeBanner: false,

      home: SplashScreen(),
    );
  }
}
