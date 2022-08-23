import 'package:flutter/cupertino.dart';
import 'package:greisy_photos/core/constants/screen_sizes.dart';
import 'package:greisy_photos/features/landing_page/presentation/pages/desktop/desktop_landing_page.dart';
import 'package:greisy_photos/features/landing_page/presentation/pages/mobile/mobile_landing_page.dart';
import 'package:greisy_photos/features/landing_page/presentation/pages/tablet/table_landing_page.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    Key? key,
    required this.mobilePage,
    required this.desktopPage,
    required this.tabletPage,
  }) : super(key: key);

  final Widget mobilePage;
  final Widget desktopPage;
  final Widget tabletPage;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      if (constrains.maxWidth >= desktopWidth) {
        return const DesktopLandingPage();
      } else if (constrains.maxWidth >= tabletWidth) {
        return const TabletLandingPage();
      } else {
        return const MobileLandingPage();
      }
    });
  }
}
