import 'package:flutter_test/flutter_test.dart';
import 'package:greisy_photos/core/error/faillure.dart';
import 'package:greisy_photos/features/user_profile/data/data_source/user_profile_data_source.dart';
import 'package:greisy_photos/features/user_profile/data/model/user_profile_model.dart';
import 'package:greisy_photos/features/user_profile/data/repository/user_profile_repository_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_profile_repository_impl_test.mocks.dart';

@GenerateMocks([UserProfileDataSource])
void main() {
  MockUserProfileDataSource mockUserProfileDataSource =
      MockUserProfileDataSource();

  UserProfileRepositoryImpl userProfileRepositoryImpl =
      UserProfileRepositoryImpl(
          userProfileDataSource: mockUserProfileDataSource);

  group('User Profile data source impl tests: ', () {
    testWidgets('Should get a users profile', (tester) async {
      //ARRANGE
      var username = 'userName';
      UserProfileModel tUserProfile = UserProfileModel(
        userId: 'userId',
        profileImage: 'profileImage',
        name: username,
        profileDescription: 'profileDescription',
        photosUrl: const <String>[],
      );

      when(mockUserProfileDataSource.getUserProfile(username))
          .thenAnswer((realInvocation) => Future.value((tUserProfile)));

      //ACT
      var result = await userProfileRepositoryImpl.getUserProfile(username);

      //ASSERT
      verify(mockUserProfileDataSource.getUserProfile(username)).called(1);
      expect(true, result.isRight());
    });

    testWidgets('Should get a users profile but gets a failure',
        (tester) async {
      //ARRANGE
      when(mockUserProfileDataSource.getUserProfile(any)).thenThrow(
          (realInvocation) async =>
              Future.value(ServerFailure('Error Message')));
      //ACT
      var result =
          await userProfileRepositoryImpl.getUserProfile('someUserName');
      //ASSERT
      verify(mockUserProfileDataSource.getUserProfile(any)).called(1);
      expect(true, result.isLeft());
    });
  });
}
