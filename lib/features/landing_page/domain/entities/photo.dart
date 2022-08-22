// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Photo extends Equatable {
  final String photoId;
  final String photoUrl;
  final String photoDescription;
  final int likes;
  final String profileImage;
  final String name;
  final String userName;

  const Photo({
    required this.photoId,
    required this.photoUrl,
    required this.photoDescription,
    required this.likes,
    required this.profileImage,
    required this.name,
    required this.userName,
  });

  @override
  List<Object?> get props => [photoId];
}
