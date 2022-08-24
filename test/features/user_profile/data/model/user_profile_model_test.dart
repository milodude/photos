import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:greisy_photos/features/user_profile/data/model/user_profile_model.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  group('User profile tests: ', () {
    UserProfileModel tUserProfile = const UserProfileModel(
      userId: '5tdWPtk6hBg',
      profileImage:
          'https://images.unsplash.com/profile-1655151625963-f0eec015f2a4image?ixlib=rb-1.2.1&crop=faces&fit=crop&w=32&h=32',
      name: 'Wasa Crispbread',
      profileDescription:
          'Things we love:\r\nðŸž Crispbread (naturally)  ðŸŒ Our planet  ðŸ˜‹ Delicious food, everyday',
      photosUrl: [
        'https://images.unsplash.com/photo-1657299156261-4ce1d0a2cf5c?ixlib=rb-1.2.1&q=80&cs=tinysrgb&fm=jpg&crop=entropy',
        'https://images.unsplash.com/photo-1657299156537-2fd96dc2446e?ixlib=rb-1.2.1&q=80&cs=tinysrgb&fm=jpg&crop=entropy',
        'https://images.unsplash.com/photo-1657299156000-2cccaea36b2b?ixlib=rb-1.2.1&q=80&cs=tinysrgb&fm=jpg&crop=entropy',
      ],
    );
    testWidgets('Should parse a user profile from a json response',
        (tester) async {
      //Arrange
      final Map<String, dynamic> decoded =
          json.decode(fixture('user_profile/user_profile_fixture.json'));
      //Act
      var result = UserProfileModel.fromJson(decoded);
      //Assert
      expect(result, equals(tUserProfile));
    });
  });
}
