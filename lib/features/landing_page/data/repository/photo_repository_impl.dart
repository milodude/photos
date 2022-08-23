import 'package:greisy_photos/features/landing_page/data/model/photo_model.dart';
import 'package:greisy_photos/core/error/faillure.dart';
import 'package:dartz/dartz.dart';
import 'package:greisy_photos/features/landing_page/domain/repository/photo_repository.dart';

import '../data_source/photo_data_source.dart';

class PhotoRepositoryImpl extends PhotoRepository {
  final PhotoDataSource photoDataSource;

  PhotoRepositoryImpl({required this.photoDataSource});

  @override
  Future<Either<Failure, List<PhotoModel>>> getPhotos() async {
    try {
      var result = await photoDataSource.getPhotos();
      return Right(result);
    } on ServerFailure catch (e) {
      return Left(ServerFailure('Server error while sending the request: $e'));
    } catch (e) {
      return Left(ServerFailure('Server error while sending the request'));
    }
  }
}
