import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:greisy_photos/features/landing_page/domain/entities/photo.dart';
import 'package:greisy_photos/features/landing_page/domain/use_cases/get_photo_use_case.dart';

import '../../../../../core/use_cases/use_case.dart';

part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final GetPhotoUseCase getPhotoUseCase;

  PhotoBloc({required this.getPhotoUseCase}) : super(Initial()) {
    on<PhotoEvent>((event, emit) async {
      if (event is GetPhotosEvent) {
        emit(Loading());
        final result = await getPhotoUseCase(NoParams());
        result.fold(
          (left) => emit(Error(errorMessage: left.toString())),
          (right) {
            emit(Loaded(right));
          },
        );
      }
    });
  }
}
