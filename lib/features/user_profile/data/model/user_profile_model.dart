import 'package:greisy_photos/features/user_profile/domain/entity/user_profile.dart';

import 'aux_photo_model.dart';

class UserProfileModel extends UserProfile {
  const UserProfileModel({
    required super.userId,
    required super.profileImage,
    required super.name,
    required super.profileDescription,
    required super.photosUrl,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> userProfile) {
    List<AuxPhotoModel> photoList = userProfile['photos']
        .map<AuxPhotoModel>(
            (e) => AuxPhotoModel.fromJson(e as Map<String, dynamic>))
        .toList();

    return UserProfileModel(
      userId: userProfile['id'],
      profileImage: userProfile['profile_image']['small'] ??
          userProfile['profile_image']['medium'],
      name: userProfile['name'],
      profileDescription: userProfile['bio'],
      photosUrl: photoList.map((e) => e.photoUrl).toList(),
    );
  }
}
