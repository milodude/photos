import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:greisy_photos/core/use_cases/use_case.dart';
import 'package:greisy_photos/features/landing_page/domain/entities/photo.dart';
import 'package:greisy_photos/features/landing_page/domain/repository/photo_repository.dart';
import 'package:greisy_photos/features/landing_page/domain/use_cases/get_photo_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_photo_use_case_test.mocks.dart';

@GenerateMocks([PhotoRepository])
void main() {
  MockPhotoRepository photoRepository = MockPhotoRepository();
  GetPhotoUseCase useCase = GetPhotoUseCase(photoRepository: photoRepository);

  group('Use case: Get Photos', () {
    test('Should get a list of photos', () async {
      //Arrange
      var tPhotoList = <PhotoEntity>[
        const PhotoEntity(
          photoId: 'photoId1',
          photoUrl: 'www.someUrl.com',
          photoDescription: 'My photo description',
          likes: 70,
          profileImage: 'www.myImageurl.com',
          name: 'Jonathan Banks',
          userName: 'betterCallJonathan',
        )
      ];

      when(photoRepository.getPhotos())
          .thenAnswer((realInvocation) => Future.value(Right(tPhotoList)));

      //Act
      var result = await useCase.call(NoParams());

      //Assert
      expect(result, Right(tPhotoList));
      verify(photoRepository.getPhotos()).called(1);
    });
  });
}
