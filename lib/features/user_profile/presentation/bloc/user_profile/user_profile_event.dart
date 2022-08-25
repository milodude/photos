// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_profile_bloc.dart';

abstract class UserProfileEvent extends Equatable {
  const UserProfileEvent();

  @override
  List<Object> get props => [];
}

class GetUserProfileEvent extends UserProfileEvent {
  final String userName;
  const GetUserProfileEvent({
    required this.userName,
  });
}

class ClearUserProfileEvent extends UserProfileEvent {}
