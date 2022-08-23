import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:greisy_photos/core/error/faillure.dart';
import 'package:greisy_photos/features/landing_page/domain/entities/photo.dart';
import 'package:greisy_photos/features/photo_details/domain/use_cases/get_photo_details_use_case.dart';
import 'package:greisy_photos/features/photo_details/presentation/bloc/photo_details/photo_details_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'photo_details_bloc_test.mocks.dart';

@GenerateMocks([GetPhotoDetailsUseCase])
void main() {
  MockGetPhotoDetailsUseCase mockGetPhotoDetailsUseCase =
      MockGetPhotoDetailsUseCase();
  late PhotoDetailsBloc bloc =
      PhotoDetailsBloc(getPhotoDetailsUseCase: mockGetPhotoDetailsUseCase);

  var tPhotoDetails = const Photo(
      photoId: '1',
      photoUrl: 'photoUrl',
      photoDescription: 'photoDescription',
      likes: 70,
      profileImage: 'profileImage',
      name: 'name',
      userName: 'userName');

  group('Photo details bloc tests: ', () {
    setUp(() {
      bloc.close();
      bloc =
          PhotoDetailsBloc(getPhotoDetailsUseCase: mockGetPhotoDetailsUseCase);
    });

    blocTest('emits [] when nothing is added',
        build: () => bloc,
        expect: () => [],
        wait: const Duration(milliseconds: 500));

    blocTest<PhotoDetailsBloc, PhotoDetailsState>(
        'emits [Loading, Loaded] when getting photos list.',
        setUp: () => when(mockGetPhotoDetailsUseCase.call(any)).thenAnswer(
            (realInvocation) async => Future.value(Right(tPhotoDetails))),
        build: () {
          return bloc;
        },
        act: (bloc) => bloc.add(const GetPhotoDetailsEvent(photoId: 'photoId')),
        expect: () => <PhotoDetailsState>[
              PhotoDetailsLoading(),
              PhotoDetailsLoaded(photoDetails: tPhotoDetails)
            ],
        tearDown: bloc.close,
        wait: const Duration(milliseconds: 500));

    blocTest<PhotoDetailsBloc, PhotoDetailsState>(
        'emits [Loading, Error] when getting my watchlists fails.',
        setUp: () => when(mockGetPhotoDetailsUseCase.call(any)).thenAnswer(
            (realInvocation) async =>
                Future.value(Left(ServerFailure(serverException)))),
        build: () {
          return bloc;
        },
        act: (bloc) => bloc.add(const GetPhotoDetailsEvent(photoId: 'photoId')),
        expect: () => <PhotoDetailsState>[
              PhotoDetailsLoading(),
              const PhotoDetailsError(errorMessage: serverException)
            ],
        wait: const Duration(milliseconds: 500));
  });
}
