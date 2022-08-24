// ignore_for_file: public_member_api_docs, sort_constructors_first
class AuxPhotoModel {
  final String photoUrl;

  AuxPhotoModel({
    required this.photoUrl,
  });

  factory AuxPhotoModel.fromJson(Map<String, dynamic> photo) {
    return AuxPhotoModel(
      photoUrl: photo['urls']['full'] ?? photo['urls']['raw'],
    );
  }
}
