import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:greisy_photos/features/landing_page/data/model/photo_model.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  group('Photo Model: ', () {
    PhotoModel tPhotoModel = const PhotoModel(
        photoId: 'OkEWBR1g-2c',
        photoUrl:
            'https://images.unsplash.com/photo-1657299171054-e679f630a776?crop=entropy&cs=tinysrgb&fm=jpg&ixid=MnwzNTc2ODN8MXwxfGFsbHwxfHx8fHx8Mnx8MTY2MTE3ODcyMQ&ixlib=rb-1.2.1&q=80',
        photoDescription: '',
        likes: 88,
        profileImage:
            'https://images.unsplash.com/profile-1655151625963-f0eec015f2a4image?ixlib=rb-1.2.1&crop=faces&fit=crop&w=32&h=32',
        name: 'Wasa Crispbread',
        userName: 'wasacrispbread');

    testWidgets('Should be a photoModel', (tester) async {
      expect(tPhotoModel, isA<PhotoModel>());
    });

    testWidgets('Should parse a photo from a json response', (tester) async {
      //Arrange
      final Map<String, dynamic> decoded =
          json.decode(fixture('photo/photo_fixture.json'));
      //Act
      var result = PhotoModel.fromJson(decoded);
      //Assert
      expect(result, equals(tPhotoModel));
    });

    testWidgets('Should parse all photo fields from a json response',
        (tester) async {
      //Arrange
      final Map<String, dynamic> decoded =
          json.decode(fixture('photo/photo_fixture.json'));
      //Act
      var result = PhotoModel.fromJson(decoded);
      //Assert
      expect(result.photoId, equals(tPhotoModel.photoId));
      expect(result.photoUrl, equals(tPhotoModel.photoUrl));
      expect(result.photoDescription, equals(tPhotoModel.photoDescription));
      expect(result.likes, equals(tPhotoModel.likes));
      expect(result.profileImage, equals(tPhotoModel.profileImage));
      expect(result.name, equals(tPhotoModel.name));
      expect(result.userName, equals(tPhotoModel.userName));
    });
  });
}
