import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:greisy_photos/core/error/faillure.dart';
import 'package:greisy_photos/features/user_profile/domain/entity/user_profile.dart';
import 'package:greisy_photos/features/user_profile/domain/repository/user_profile_repository.dart';
import 'package:greisy_photos/features/user_profile/domain/use_cases/get_user_profile_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_user_profile_use_case_test.mocks.dart';

@GenerateMocks([UserProfileRepository])
void main() {
  MockUserProfileRepository mockUserProfileRepository =
      MockUserProfileRepository();
  GetUserProfileUseCase useCase =
      GetUserProfileUseCase(userProfileRepository: mockUserProfileRepository);

  group('Get profile use case tests:', () {
    testWidgets('Should get a users profile', (tester) async {
      //ARRANGE
      var userName = 'userName';
      UserProfile tUserProfile = UserProfile(
          userId: 'userId',
          profileImage: 'profileImage',
          name: userName,
          profileDescription: 'profileDescription',
          photosUrl: const ['url1', 'url2']);

      when(mockUserProfileRepository.getUserProfile(any))
          .thenAnswer((realInvocation) => Future.value(Right(tUserProfile)));
      //ACT
      var result = await useCase.call(userName);
      //ASSERT
      expect(result, Right(tUserProfile));
      verify(mockUserProfileRepository.getUserProfile(any)).called(1);
    });

    testWidgets('Should throw a Failure', (tester) async {
      //ARRANGE
      const errorMessage = 'Some error';
      when(mockUserProfileRepository.getUserProfile(any))
          .thenAnswer(((realInvocation) {
        return Future.value(Left(ServerFailure(errorMessage)));
      }));
      //ACT
      var result = await useCase('any');
      //ASSERT
      expect(result, Left(ServerFailure(errorMessage)));
      verify(mockUserProfileRepository.getUserProfile(any)).called(1);
    });
  });
}
