import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:greisy_photos/core/error/faillure.dart';
import 'package:greisy_photos/features/landing_page/domain/entities/photo.dart';
import 'package:greisy_photos/features/photo_details/domain/repository/photo_details_repository.dart';
import 'package:greisy_photos/features/photo_details/domain/use_cases/get_photo_details_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_photo_details_use_case_test.mocks.dart';

@GenerateMocks([PhotoDetailsRepository])
void main() {
  MockPhotoDetailsRepository mockPhotoDetailsRepository =
      MockPhotoDetailsRepository();
  GetPhotoDetailsUseCase useCase = GetPhotoDetailsUseCase(
      photoDetailsRepository: mockPhotoDetailsRepository);

  group('GetPhotoDetailsUseCase: ', () {
    Photo tPhoto = const Photo(
      photoId: 'photoId',
      photoUrl: 'photoUrl',
      photoDescription: 'photoDescription',
      likes: 70,
      profileImage: 'profileImage',
      name: 'name',
      userName: 'userName',
    );

    testWidgets('Should get photo details', (tester) async {
      //ARRANGE
      when(mockPhotoDetailsRepository.getPhoto(any))
          .thenAnswer((realInvocation) => Future.value(
                Right(tPhoto),
              ));
      //ACT
      var photoId = 'photoId';
      var result = await useCase.call(photoId);

      //ASSERT
      expect(result, Right(tPhoto));
      verify(mockPhotoDetailsRepository.getPhoto(photoId)).called(1);
    });

    testWidgets('Should throw a Failure', (tester) async {
      //ARRANGE
      const errorMessage = 'Some error';
      when(mockPhotoDetailsRepository.getPhoto(any))
          .thenAnswer(((realInvocation) {
        return Future.value(Left(ServerFailure(errorMessage)));
      }));
      //ACT
      var result = await useCase('photoId');
      //ASSERT
      expect(result, Left(ServerFailure(errorMessage)));
      verify(mockPhotoDetailsRepository.getPhoto(any)).called(1);
    });
  });
}
