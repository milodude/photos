// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class UserProfile extends Equatable {
  final String userId;
  final String profileImage;
  final String name;
  final String profileDescription; //bio
  final List<String> photosUrl;

  const UserProfile({
    required this.userId,
    required this.profileImage,
    required this.name,
    required this.profileDescription,
    required this.photosUrl,
  });

  @override
  List<Object?> get props => [userId];
}
