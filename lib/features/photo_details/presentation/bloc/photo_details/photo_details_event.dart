// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'photo_details_bloc.dart';

abstract class PhotoDetailsEvent extends Equatable {
  const PhotoDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetPhotoDetailsEvent extends PhotoDetailsEvent {
  final String photoId;

  const GetPhotoDetailsEvent({
    required this.photoId,
  });
}
