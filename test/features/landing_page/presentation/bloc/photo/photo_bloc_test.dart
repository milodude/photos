import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:greisy_photos/core/error/faillure.dart';
import 'package:greisy_photos/core/use_cases/use_case.dart';
import 'package:greisy_photos/features/landing_page/domain/entities/photo.dart';
import 'package:greisy_photos/features/landing_page/domain/use_cases/get_photo_use_case.dart';
import 'package:greisy_photos/features/landing_page/presentation/bloc/photo/photo_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';

import 'photo_bloc_test.mocks.dart';

@GenerateMocks([GetPhotoUseCase])
void main() {
  MockGetPhotoUseCase mockGetPhotoUseCase = MockGetPhotoUseCase();
  late PhotoBloc bloc = PhotoBloc(getPhotoUseCase: mockGetPhotoUseCase);

  List<Photo> tPhotoData = <Photo>[
    const Photo(
        photoId: '1',
        photoUrl: 'photoUrl',
        photoDescription: 'photoDescription',
        likes: 70,
        profileImage: 'profileImage',
        name: 'name',
        userName: 'userName'),
    const Photo(
        photoId: '2',
        photoUrl: 'photoUrl',
        photoDescription: 'photoDescription',
        likes: 07,
        profileImage: 'profileImage',
        name: 'name',
        userName: 'userName'),
  ];
  group('Photo bloc: ', () {
    setUp(() {
      bloc.close();
      bloc = PhotoBloc(getPhotoUseCase: mockGetPhotoUseCase);
    });

    blocTest('emits [] when nothing is added',
        build: () => bloc,
        expect: () => [],
        wait: const Duration(milliseconds: 500));

    blocTest<PhotoBloc, PhotoState>(
        'emits [Loading, Loaded] when getting photos list.',
        setUp: () => when(mockGetPhotoUseCase.call(NoParams())).thenAnswer(
            (realInvocation) async => Future.value(Right(tPhotoData))),
        build: () {
          return bloc;
        },
        act: (bloc) => bloc.add(const GetPhotosEvent()),
        expect: () => <PhotoState>[Loading(), Loaded(tPhotoData)],
        tearDown: bloc.close,
        wait: const Duration(milliseconds: 500));

    blocTest<PhotoBloc, PhotoState>(
        'emits [Loading, Error] when getting my watchlists fails.',
        setUp: () => when(mockGetPhotoUseCase.call(NoParams())).thenAnswer(
            (realInvocation) async =>
                Future.value(Left(ServerFailure(serverException)))),
        build: () {
          return bloc;
        },
        act: (bloc) => bloc.add(const GetPhotosEvent()),
        expect: () =>
            <PhotoState>[Loading(), Error(errorMessage: serverException)],
        wait: const Duration(milliseconds: 500));
  });
}
