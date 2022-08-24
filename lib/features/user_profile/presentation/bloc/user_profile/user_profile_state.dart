// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_profile_bloc.dart';

abstract class UserProfileState extends Equatable {
  const UserProfileState();

  @override
  List<Object> get props => [];
}

class UserProfileInitial extends UserProfileState {}

class UserProfileLoading extends UserProfileState {}

class UserProfileLoaded extends UserProfileState {
  final UserProfile userProfile;

  const UserProfileLoaded({
    required this.userProfile,
  });
}

class UserProfileError extends UserProfileState {
  final String errorMessage;

  const UserProfileError({
    required this.errorMessage,
  });
}
