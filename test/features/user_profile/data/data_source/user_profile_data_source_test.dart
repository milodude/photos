import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:greisy_photos/core/constants/access.dart';
import 'package:greisy_photos/core/error/faillure.dart';
import 'package:greisy_photos/core/providers/url_provider.dart';
import 'package:greisy_photos/features/user_profile/data/data_source/user_profile_data_source.dart';
import 'package:greisy_photos/features/user_profile/data/model/user_profile_model.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'user_profile_data_source_test.mocks.dart';

@GenerateMocks([http.Client, UrlProvider])
void main() {
  MockUrlProvider mockUrlProvider = MockUrlProvider();
  MockClient mockClient = MockClient();

  UserProfileDataSource userProfileDataSource = UserProfileDataSource(
      httpClient: mockClient, urlProvider: mockUrlProvider);

  final tUserProfileResponse =
      json.decode(fixture('user_profile/user_profile_fixture.json'));

  group('User pofile data source tests: ', () {
    void setUpHttpCallSuccess200() {
      final uri = UrlProvider().getUrl('/users', {});
      when(mockClient.get(uri, headers: {
        'Content-type': 'application/json; charset=utf-8',
        'Accept': '*/*',
        'Access-Control-Allow-Origin': '*',
        'Authorization': accessKey,
      })).thenAnswer((_) async => Future.value(http.Response(
              fixture('user_profile/user_profile_fixture.json'), 200,
              headers: {
                HttpHeaders.contentTypeHeader:
                    'application/json; charset=utf-8',
              })));
      when(mockUrlProvider.getUrl(any, any))
          .thenAnswer((realInvocation) => uri);
    }

    testWidgets('Should get a users profile withut any issues', (tester) async {
      //Arrange
      setUpHttpCallSuccess200();
      //Act
      var result = await userProfileDataSource.getUserProfile('userName');
      //Assert
      expect(result, equals(UserProfileModel.fromJson(tUserProfileResponse)));
    });

    test('Should throw a serverException when the respond is 404', () async {
      //Arrange
      final uri = UrlProvider().getUrl('/users', {});
      when(mockUrlProvider.getUrl(any, any))
          .thenAnswer((realInvocation) => uri);

      when(mockClient.get(uri, headers: anyNamed('headers'))).thenAnswer(
        (realInvocation) async =>
            http.Response('Something went wrong while getting clients', 404),
      );
      //Act
      final call = userProfileDataSource.getUserProfile('someUserName');
      //Assert
      expect(() => call, throwsA(const TypeMatcher<ServerFailure>()));
    });
  });
}
