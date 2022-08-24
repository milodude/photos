import 'package:greisy_photos/features/landing_page/domain/entities/photo.dart';

class PhotoModel extends Photo {
  const PhotoModel({
    required super.photoId,
    required super.photoUrl,
    required super.photoDescription,
    required super.likes,
    required super.profileImage,
    required super.name,
    required super.userName,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> photo) {
    String? altDes = photo['alt_description'];
    String? des = photo['description'];
    String description = '';
    bool hasNoDescription = false;
    if (des != null) {
      description = des;
    } else if (altDes != null) {
      description = altDes;
    } else {
      hasNoDescription = !hasNoDescription;
    }

    return PhotoModel(
      photoId: photo['id'],
      photoUrl: photo['urls']['full'],
      photoDescription:
          hasNoDescription ? 'No description Available' : description,
      likes: photo['likes'],
      profileImage: photo['user']['profile_image']['small'] ??
          photo['user']['profile_image']['medium'],
      name: photo['user']['name'] ?? '',
      userName: photo['user']['username'] ?? '',
    );
  }
}
