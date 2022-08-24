// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:greisy_photos/core/error/faillure.dart';
import 'package:greisy_photos/core/use_cases/use_case.dart';
import 'package:greisy_photos/features/user_profile/domain/entity/user_profile.dart';
import 'package:greisy_photos/features/user_profile/domain/repository/user_profile_repository.dart';

class GetUserProfileUseCase implements UseCase<UserProfile, String> {
  final UserProfileRepository userProfileRepository;

  GetUserProfileUseCase({
    required this.userProfileRepository,
  });

  @override
  Future<Either<Failure, UserProfile>> call(String userName) {
    return userProfileRepository.getUserProfile(userName);
  }
}
