import 'package:dartz/dartz.dart';
import 'package:greisy_photos/features/landing_page/domain/repository/photo_repository.dart';

import '../../../../core/error/faillure.dart';
import '../../../landing_page/domain/entities/photo.dart';

abstract class PhotoDetailsRepository extends PhotoRepository {
  Future<Either<Failure, Photo>> getPhoto(String photoId);
}
