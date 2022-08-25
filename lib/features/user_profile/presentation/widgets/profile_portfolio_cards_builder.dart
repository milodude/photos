// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../domain/entity/user_profile.dart';
import 'carousel.dart';

class ProfilePortfolioCardsBuilder extends StatelessWidget {
  const ProfilePortfolioCardsBuilder({
    Key? key,
    required this.userProfile,
    required this.urlId,
  }) : super(key: key);

  final UserProfile userProfile;
  final int urlId;

  @override
  Widget build(BuildContext context) {
    return Card(
      key: const Key('SliverCard'),
      child: Material(
        child: InkWell(
          key: const Key('SliverInkwell'),
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (context) =>
                    CarouselWidget(urls: userProfile.photosUrl));
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: GridTile(
              key: const Key('SliverGridTile'),
              child: Image.network(
                userProfile.photosUrl[urlId],
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
