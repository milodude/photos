// Mocks generated by Mockito 5.3.0 from annotations
// in greisy_photos/test/features/photo_details/presentation/bloc/photo_details/photo_details_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:greisy_photos/core/error/faillure.dart' as _i6;
import 'package:greisy_photos/features/landing_page/domain/entities/photo.dart'
    as _i7;
import 'package:greisy_photos/features/photo_details/domain/repository/photo_details_repository.dart'
    as _i2;
import 'package:greisy_photos/features/photo_details/domain/use_cases/get_photo_details_use_case.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakePhotoDetailsRepository_0 extends _i1.SmartFake
    implements _i2.PhotoDetailsRepository {
  _FakePhotoDetailsRepository_0(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

/// A class which mocks [GetPhotoDetailsUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetPhotoDetailsUseCase extends _i1.Mock
    implements _i4.GetPhotoDetailsUseCase {
  MockGetPhotoDetailsUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.PhotoDetailsRepository get photoDetailsRepository =>
      (super.noSuchMethod(Invocation.getter(#photoDetailsRepository),
              returnValue: _FakePhotoDetailsRepository_0(
                  this, Invocation.getter(#photoDetailsRepository)))
          as _i2.PhotoDetailsRepository);
  @override
  set photoDetailsRepository(
          _i2.PhotoDetailsRepository? _photoDetailsRepository) =>
      super.noSuchMethod(
          Invocation.setter(#photoDetailsRepository, _photoDetailsRepository),
          returnValueForMissingStub: null);
  @override
  _i5.Future<_i3.Either<_i6.Failure, _i7.Photo>> call(String? photoId) =>
      (super.noSuchMethod(Invocation.method(#call, [photoId]),
              returnValue: _i5.Future<_i3.Either<_i6.Failure, _i7.Photo>>.value(
                  _FakeEither_1<_i6.Failure, _i7.Photo>(
                      this, Invocation.method(#call, [photoId]))))
          as _i5.Future<_i3.Either<_i6.Failure, _i7.Photo>>);
}
