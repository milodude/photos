import 'package:dartz/dartz.dart';

import '../../../../core/error/faillure.dart';
import '../../../landing_page/domain/entities/photo.dart';

abstract class PhotoDetailsRepository {
  Future<Either<Failure, Photo>> getPhoto(String photoId);
}
