import 'package:flutter/material.dart';

import '../../domain/entity/user_profile.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    Key? key,
    required this.width,
    required this.userProfile,
  }) : super(key: key);

  final double width;
  final UserProfile userProfile;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width - width * 0.2,
      child: ListTile(
        leading: ClipOval(
            child: Image.network(
          userProfile.profileImage,
          scale: 0.5,
        )),
        title: Text(
          userProfile.name,
          style: const TextStyle(
              fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            userProfile.profileDescription,
            style: const TextStyle(fontSize: 12, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
