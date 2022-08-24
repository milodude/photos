// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:greisy_photos/features/user_profile/domain/entity/user_profile.dart';

class MobileUserProfilePage extends StatelessWidget {
  final UserProfile userProfile;

  const MobileUserProfilePage({
    Key? key,
    required this.userProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Loaded')),
    );
  }
}
