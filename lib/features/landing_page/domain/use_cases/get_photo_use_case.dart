import 'package:greisy_photos/core/error/faillure.dart';
import 'package:dartz/dartz.dart';
import 'package:greisy_photos/features/landing_page/domain/entities/photo.dart';
import 'package:greisy_photos/features/landing_page/domain/repository/photo_repository.dart';

import '../../../../core/use_cases/use_case.dart';

class GetPhotoUseCase implements UseCase<List<Photo>, NoParams> {
  final PhotoRepository photoRepository;

  GetPhotoUseCase({required this.photoRepository});

  @override
  Future<Either<Failure, List<Photo>>> call(NoParams params) {
    return photoRepository.getPhotos();
  }
}
