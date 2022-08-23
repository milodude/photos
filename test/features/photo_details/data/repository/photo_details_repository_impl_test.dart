import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:greisy_photos/core/error/faillure.dart';
import 'package:greisy_photos/features/landing_page/data/data_source/photo_data_source.dart';
import 'package:greisy_photos/features/landing_page/data/model/photo_model.dart';
import 'package:greisy_photos/features/photo_details/data/repository/photo_details_repository_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'photo_details_repository_impl_test.mocks.dart';

@GenerateMocks([PhotoDataSource])
void main() {
  MockPhotoDataSource mockPhotoDataSource = MockPhotoDataSource();
  PhotoDetailsRepositoryImpl photoDetailsRepositoryImpl =
      PhotoDetailsRepositoryImpl(photoDataSource: mockPhotoDataSource);
  final tPhotoResponse = json.decode(fixture('photo/photo_fixture.json'));

  group('PhotoDetailsrepository tests: ', () {
    testWidgets('Should get a photo details', (tester) async {
      //ARRANGE
      when(mockPhotoDataSource.getPhoto(any)).thenAnswer((realInvocation) =>
          Future.value(PhotoModel.fromJson(tPhotoResponse)));

      //ACT
      var result = await photoDetailsRepositoryImpl.getPhoto('photoId');

      //ARRANGE
      verify(mockPhotoDataSource.getPhoto('photoId'));
      expect(true, result.isRight());
    });

    testWidgets('Should get a photo details but gets a failure',
        (tester) async {
      //ARRANGE
      when(mockPhotoDataSource.getPhoto(any)).thenThrow(
          (realInvocation) async =>
              Future.value(ServerFailure('Error Message')));
      //ACT
      var result = await photoDetailsRepositoryImpl.getPhoto('photoId');
      //ASSERT
      verify(mockPhotoDataSource.getPhoto('photoId'));
      expect(true, result.isLeft());
    });
  });
}
