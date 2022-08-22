import 'package:greisy_photos/features/landing_page/data/model/photo_model.dart';

abstract class PhotoRepositoryDataSource {
  Future<List<PhotoModel>> getPhotos();
}

class PhotoDataSource implements PhotoRepositoryDataSource {
  @override
  Future<List<PhotoModel>> getPhotos() {
    // TODO: implement getPhotos
    throw UnimplementedError();
  }
}
