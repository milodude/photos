// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:greisy_photos/features/landing_page/data/data_source/photo_data_source.dart';

import '../../../../core/error/faillure.dart';
import '../../../landing_page/domain/entities/photo.dart';
import '../../domain/repository/photo_details_repository.dart';

class PhotoDetailsRepositoryImpl extends PhotoDetailsRepository {
  final PhotoDataSource photoDataSource;

  PhotoDetailsRepositoryImpl({
    required this.photoDataSource,
  });

  @override
  Future<Either<Failure, Photo>> getPhoto(String photoId) async {
    try {
      var result = await photoDataSource.getPhoto(photoId);
      return Right(result);
    } on ServerFailure catch (e) {
      return Left(ServerFailure('Server error while sending the request: $e'));
    } catch (e) {
      return Left(ServerFailure('Server error while sending the request'));
    }
  }
}
