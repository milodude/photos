import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:greisy_photos/core/error/faillure.dart';
import 'package:greisy_photos/core/use_cases/use_case.dart';
import 'package:greisy_photos/features/landing_page/domain/entities/photo.dart';
import 'package:greisy_photos/features/landing_page/domain/repository/photo_repository.dart';
import 'package:greisy_photos/features/landing_page/domain/use_cases/get_photo_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_photo_use_case_test.mocks.dart';

@GenerateMocks([PhotoRepository])
void main() {
  MockPhotoRepository mockPhotoRepository = MockPhotoRepository();
  GetPhotoUseCase useCase =
      GetPhotoUseCase(photoRepository: mockPhotoRepository);

  group('Use case: Get Photos', () {
    test('Should get a list of photos', () async {
      //Arrange
      var tPhotoList = <Photo>[
        const Photo(
          photoId: 'photoId1',
          photoUrl: 'www.someUrl.com',
          photoDescription: 'My photo description',
          likes: 70,
          profileImage: 'www.myImageurl.com',
          name: 'Jonathan Banks',
          userName: 'betterCallJonathan',
        )
      ];

      when(mockPhotoRepository.getPhotos())
          .thenAnswer((realInvocation) => Future.value(Right(tPhotoList)));

      //Act
      var result = await useCase.call(NoParams());

      //Assert
      expect(result, Right(tPhotoList));
      verify(mockPhotoRepository.getPhotos()).called(1);
    });

    testWidgets('Should throw a Failure', (tester) async {
      //ARRANGE
      const errorMessage = 'Some error';
      when(mockPhotoRepository.getPhotos()).thenAnswer(((realInvocation) {
        return Future.value(Left(ServerFailure(errorMessage)));
      }));
      //ACT
      var result = await useCase(NoParams());
      //ASSERT
      expect(result, Left(ServerFailure(errorMessage)));
      verify(mockPhotoRepository.getPhotos()).called(1);
    });
  });
}
