import 'package:flutter/material.dart';

import '../layouts/desktop_layout.dart';
import '../layouts/mobile_layout.dart';
import '../layouts/tablet_layout.dart';
import '../responsive_layout.dart';

class SiteTemplate extends StatelessWidget {
  const SiteTemplate({
    super.key,
    this.desktopLayoutBody,
    this.tabletLayoutBody,
    this.mobileLayoutBody,
    this.useLayout = true,
  });

  //layouts body according to differant platforms
  final Widget? desktopLayoutBody;
  final Widget? tabletLayoutBody;
  final Widget? mobileLayoutBody;

  //flag which check if using layout or not
  final bool useLayout;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      desktopLayout:
          useLayout
              ? DesktopLayout(body: desktopLayoutBody)
              : desktopLayoutBody ?? const SizedBox(),
      tabletLayout:
          useLayout
              ? TabletLayout(body: tabletLayoutBody ?? desktopLayoutBody)
              : tabletLayoutBody ?? const SizedBox(),
      mobileLayout:
          useLayout
              ? MobileLayout(body: mobileLayoutBody ?? desktopLayoutBody)
              : mobileLayoutBody ?? const SizedBox(),
    );
  }
}
