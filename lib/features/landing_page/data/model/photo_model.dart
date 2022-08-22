import 'package:greisy_photos/features/landing_page/domain/entities/photo.dart';

class PhotoModel extends PhotoEntity {
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
    return PhotoModel(
      photoId: photo['id'],
      photoUrl: photo['urls']['full'],
      photoDescription: photo['description'] ?? '',
      likes: photo['likes'],
      profileImage: photo['user']['profile_image']['small'] ??
          photo['user']['profile_image']['medium'],
      name: photo['user']['name'] ?? '',
      userName: photo['user']['username'] ?? '',
    );
  }
}
