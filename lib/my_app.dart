import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/bindings/inti_bindings.dart';
import 'package:my_portfolio/common/responsive/templates/site_template.dart';
import 'package:my_portfolio/pages/portfolio_page_mobile.dart';
import 'package:my_portfolio/pages/portfolio_page_tablet.dart';

import 'pages/portfolio_page_desktop.dart';

import 'package:web/web.dart' as web;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    web.document.title = "Ahmed Ebrahim";
    return GetMaterialApp(
      initialBinding: InitialBindings(),
      debugShowCheckedModeBanner: false,
      home: SiteTemplate(
        desktopLayoutBody: PortfolioPageDesktop(),
        tabletLayoutBody: PortfolioPageTablet(),
        mobileLayoutBody: PortfolioPageMobile(),
      ),
    );
  }
}
