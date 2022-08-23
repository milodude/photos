// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:greisy_photos/core/error/faillure.dart';
import 'package:greisy_photos/core/use_cases/use_case.dart';
import 'package:greisy_photos/features/landing_page/domain/entities/photo.dart';
import 'package:greisy_photos/features/photo_details/domain/repository/photo_details_repository.dart';

class GetPhotoDetailsUseCase implements UseCase<Photo, String> {
  PhotoDetailsRepository photoDetailsRepository;

  GetPhotoDetailsUseCase({
    required this.photoDetailsRepository,
  });

  @override
  Future<Either<Failure, Photo>> call(String photoId) {
    return photoDetailsRepository.getPhoto(photoId);
  }
}
