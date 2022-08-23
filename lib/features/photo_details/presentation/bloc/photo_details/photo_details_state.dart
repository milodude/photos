// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'photo_details_bloc.dart';

abstract class PhotoDetailsState extends Equatable {
  const PhotoDetailsState();

  @override
  List<Object> get props => [];
}

class PhotoDetailsInitial extends PhotoDetailsState {}

class PhotoDetailsLoading extends PhotoDetailsState {}

class PhotoDetailsLoaded extends PhotoDetailsState {
  final Photo photoDetails;

  const PhotoDetailsLoaded({
    required this.photoDetails,
  });
}

class PhotoDetailsError extends PhotoDetailsState {
  final String errorMessage;

  const PhotoDetailsError({
    required this.errorMessage,
  });
}
