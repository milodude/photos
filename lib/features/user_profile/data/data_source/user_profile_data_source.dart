import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/constants/access.dart';
import '../../../../core/error/faillure.dart';
import '../../../../core/providers/url_provider.dart';
import '../model/user_profile_model.dart';

abstract class UserProfileRepositoryDataSource {
  Future<UserProfileModel> getUserProfile(String username);
}

class UserProfileDataSource implements UserProfileRepositoryDataSource {
  final http.Client httpClient;
  final UrlProvider urlProvider;

  UserProfileDataSource({
    required this.httpClient,
    required this.urlProvider,
  });

  @override
  Future<UserProfileModel> getUserProfile(String username) async {
    Uri uri = urlProvider.getUrl('/users/$username', {});

    var response = await httpClient.get(uri, headers: {
      'Content-type': 'application/json; charset=utf-8',
      'Accept': '*/*',
      'Access-Control-Allow-Origin': '*',
      'Authorization': accessKey,
    });

    if (response.statusCode == 200) {
      var decodedJson = json.decode(response.body);
      UserProfileModel userProfile = UserProfileModel.fromJson(decodedJson);
      return userProfile;
    } else {
      throw ServerFailure(
          'Something went wrong while requesting photo details');
    }
  }
}
