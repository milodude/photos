import 'package:flutter/material.dart';
import 'package:greisy_photos/features/landing_page/presentation/pages/mobile/mobile_photo_list_handler.dart';

import 'top_title_mobile.dart';

class MobileLandingPage extends StatelessWidget {
  const MobileLandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heigth = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            TopTitleMobile(width: width, heigth: heigth),
            Positioned(
              height: heigth * 0.8,
              width: width,
              top: 100,
              left: 0,
              child: const MobilePhotoListHandler(),
            ),
          ],
        ),
      ),
    );
  }
}
