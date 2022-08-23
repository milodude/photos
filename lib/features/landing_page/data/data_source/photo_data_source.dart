import 'dart:convert';

import 'package:greisy_photos/core/constants/access.dart';
import 'package:greisy_photos/features/landing_page/data/model/photo_model.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/faillure.dart';
import '../../../../core/providers/url_provider.dart';

abstract class PhotoRepositoryDataSource {
  Future<List<PhotoModel>> getPhotos();
  Future<PhotoModel> getPhoto(String photoId);
}

class PhotoDataSource implements PhotoRepositoryDataSource {
  final http.Client httpClient;
  final UrlProvider urlProvider;

  PhotoDataSource({required this.httpClient, required this.urlProvider});

  @override
  Future<List<PhotoModel>> getPhotos() async {
    Uri uri = urlProvider.getUrl('/photos', {});

    var response = await httpClient.get(uri, headers: {
      'Content-type': 'application/json; charset=utf-8',
      'Accept': '*/*',
      'Access-Control-Allow-Origin': '*',
      'Authorization': accessKey,
    });
    if (response.statusCode == 200) {
      var decodedJson = json.decode(response.body);
      List<PhotoModel> clientList = <PhotoModel>[];
      for (Map<String, dynamic> item in decodedJson) {
        var client = PhotoModel.fromJson(item);
        clientList.add(client);
      }
      return clientList;
    } else {
      throw ServerFailure('Something went wrong while requesting photo list');
    }
  }

  @override
  Future<PhotoModel> getPhoto(String photoId) {
    // TODO: implement getPhoto
    throw UnimplementedError();
  }
}
