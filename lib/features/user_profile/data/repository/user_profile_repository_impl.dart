// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:greisy_photos/core/error/faillure.dart';
import 'package:greisy_photos/features/user_profile/domain/entity/user_profile.dart';
import 'package:greisy_photos/features/user_profile/domain/repository/user_profile_repository.dart';

import '../data_source/user_profile_data_source.dart';

class UserProfileRepositoryImpl extends UserProfileRepository {
  final UserProfileDataSource userProfileDataSource;

  UserProfileRepositoryImpl({
    required this.userProfileDataSource,
  });

  @override
  Future<Either<Failure, UserProfile>> getUserProfile(String userName) async {
    try {
      var result = await userProfileDataSource.getUserProfile(userName);
      return Right(result);
    } on ServerFailure catch (e) {
      return Left(ServerFailure('Server error while sending the request: $e'));
    } catch (e) {
      return Left(ServerFailure('Server error while sending the request'));
    }
  }
}
