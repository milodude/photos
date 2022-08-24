// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:greisy_photos/core/common_widgets/back_icon_button.dart';

import 'package:greisy_photos/features/user_profile/domain/entity/user_profile.dart';

import '../../widgets/profile_portfolio_cards_builder.dart';
import '../../widgets/user_info.dart';

class MobileUserProfilePage extends StatelessWidget {
  final UserProfile userProfile;

  const MobileUserProfilePage({
    Key? key,
    required this.userProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var heigth = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: heigth - heigth * 0.92,
              left: 26,
              child: const BackIconButton(
                buttonColor: Colors.black,
              ),
            ),
            Positioned(
              top: heigth - heigth * 0.84,
              left: 10,
              child: UserInfo(width: width, userProfile: userProfile),
            ),
            Positioned(
              top: heigth - heigth * 0.7,
              left: 26,
              child: const MyProfileMyPhotosTitle(),
            ),
            Positioned(
              top: heigth - heigth * 0.6,
              left: 26,
              child: SizedBox(
                width: width - width * 0.1,
                height: heigth - heigth * 0.5,
                child: userProfile.photosUrl.isEmpty
                    ? const Center(
                        child: Text(
                          'No photos found!',
                          style: TextStyle(fontSize: 30),
                        ),
                      )
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 26,
                                crossAxisSpacing: 26,
                                mainAxisExtent: 295),
                        itemCount: userProfile.photosUrl.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ProfilePortfolioCardsBuilder(
                              userProfile: userProfile, urlId: index);
                        }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
