import 'package:dartz/dartz.dart';
import 'package:greisy_photos/core/error/faillure.dart';
import 'package:greisy_photos/features/user_profile/domain/entity/user_profile.dart';

abstract class UserProfileRepository {
  Future<Either<Failure, UserProfile>> getUserProfile(String userName);
}
