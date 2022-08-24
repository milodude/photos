import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:greisy_photos/core/error/faillure.dart';
import 'package:greisy_photos/features/user_profile/domain/entity/user_profile.dart';
import 'package:greisy_photos/features/user_profile/domain/use_cases/get_user_profile_use_case.dart';
import 'package:greisy_photos/features/user_profile/presentation/bloc/user_profile/user_profile_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_profile_bloc_test.mocks.dart';

@GenerateMocks([GetUserProfileUseCase])
void main() {
  MockGetUserProfileUseCase useCase = MockGetUserProfileUseCase();
  late UserProfileBloc bloc = UserProfileBloc(getUserProfileUseCase: useCase);

  var tUserProfile = const UserProfile(
      userId: 'userId',
      profileImage: 'profileImage',
      name: 'name',
      profileDescription: 'profileDescription',
      photosUrl: <String>[]);

  group('User profile bloc tests: ', () {
    setUp(() {
      bloc.close();
      bloc = UserProfileBloc(getUserProfileUseCase: useCase);
    });
    blocTest('emits [] when nothing is added',
        build: () => bloc,
        expect: () => [],
        wait: const Duration(milliseconds: 500));

    blocTest<UserProfileBloc, UserProfileState>(
        'emits [Loading, Loaded] when getting photos list.',
        setUp: () => when(useCase.call('SomeUserName')).thenAnswer(
            (realInvocation) async => Future.value(Right(tUserProfile))),
        build: () {
          return bloc;
        },
        act: (bloc) =>
            bloc.add(const GetUserProfileEvent(userName: 'SomeUserName')),
        expect: () => <UserProfileState>[
              UserProfileLoading(),
              UserProfileLoaded(userProfile: tUserProfile)
            ],
        tearDown: bloc.close,
        wait: const Duration(milliseconds: 500));

    blocTest<UserProfileBloc, UserProfileState>(
        'emits [Loading, Error] when getting my watchlists fails.',
        setUp: () => when(useCase.call('SomeUserName')).thenAnswer(
            (realInvocation) async =>
                Future.value(Left(ServerFailure(serverException)))),
        build: () {
          return bloc;
        },
        act: (bloc) =>
            bloc.add(const GetUserProfileEvent(userName: 'SomeUserName')),
        expect: () => <UserProfileState>[
              UserProfileLoading(),
              const UserProfileError(errorMessage: serverException)
            ],
        wait: const Duration(milliseconds: 500));
  });
}
