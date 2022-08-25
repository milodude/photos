// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:greisy_photos/features/user_profile/domain/entity/user_profile.dart';
import 'package:greisy_photos/features/user_profile/domain/use_cases/get_user_profile_use_case.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final GetUserProfileUseCase getUserProfileUseCase;

  UserProfileBloc({required this.getUserProfileUseCase})
      : super(UserProfileInitial()) {
    on<UserProfileEvent>((event, emit) async {
      if (event is GetUserProfileEvent) {
        emit(UserProfileLoading());
        final result = await getUserProfileUseCase(event.userName);
        result.fold(
          (error) => emit(UserProfileError(errorMessage: error.toString())),
          (profile) {
            emit(UserProfileLoaded(userProfile: profile));
          },
        );
      }
      if (event is ClearUserProfileEvent) {
        emit(UserProfileInitial());
      }
    });
  }
}
