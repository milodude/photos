// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:greisy_photos/features/photo_details/domain/use_cases/get_photo_details_use_case.dart';

import '../../../../landing_page/domain/entities/photo.dart';

part 'photo_details_event.dart';
part 'photo_details_state.dart';

class PhotoDetailsBloc extends Bloc<PhotoDetailsEvent, PhotoDetailsState> {
  final GetPhotoDetailsUseCase getPhotoDetailsUseCase;

  PhotoDetailsBloc({required this.getPhotoDetailsUseCase})
      : super(PhotoDetailsInitial()) {
    on<PhotoDetailsEvent>((event, emit) async {
      if (event is GetPhotoDetailsEvent) {
        emit(PhotoDetailsLoading());
        final result = await getPhotoDetailsUseCase(event.photoId);
        result.fold(
          (left) => emit(PhotoDetailsError(errorMessage: left.toString())),
          (photoDetails) {
            emit(PhotoDetailsLoaded(photoDetails: photoDetails));
          },
        );
      }

      if (event is ClearPhotoDetailsEvent) {
        emit(PhotoDetailsInitial());
      }
    });
  }
}
