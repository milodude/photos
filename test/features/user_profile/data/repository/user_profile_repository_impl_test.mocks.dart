// Mocks generated by Mockito 5.3.0 from annotations
// in greisy_photos/test/features/user_profile/data/repository/user_profile_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:greisy_photos/core/providers/url_provider.dart' as _i3;
import 'package:greisy_photos/features/user_profile/data/data_source/user_profile_data_source.dart'
    as _i5;
import 'package:greisy_photos/features/user_profile/data/model/user_profile_model.dart'
    as _i4;
import 'package:http/http.dart' as _i2;
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

class _FakeClient_0 extends _i1.SmartFake implements _i2.Client {
  _FakeClient_0(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeUrlProvider_1 extends _i1.SmartFake implements _i3.UrlProvider {
  _FakeUrlProvider_1(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeUserProfileModel_2 extends _i1.SmartFake
    implements _i4.UserProfileModel {
  _FakeUserProfileModel_2(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

/// A class which mocks [UserProfileDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserProfileDataSource extends _i1.Mock
    implements _i5.UserProfileDataSource {
  MockUserProfileDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Client get httpClient =>
      (super.noSuchMethod(Invocation.getter(#httpClient),
              returnValue: _FakeClient_0(this, Invocation.getter(#httpClient)))
          as _i2.Client);
  @override
  _i3.UrlProvider get urlProvider =>
      (super.noSuchMethod(Invocation.getter(#urlProvider),
              returnValue:
                  _FakeUrlProvider_1(this, Invocation.getter(#urlProvider)))
          as _i3.UrlProvider);
  @override
  _i6.Future<_i4.UserProfileModel> getUserProfile(String? username) =>
      (super.noSuchMethod(Invocation.method(#getUserProfile, [username]),
              returnValue: _i6.Future<_i4.UserProfileModel>.value(
                  _FakeUserProfileModel_2(
                      this, Invocation.method(#getUserProfile, [username]))))
          as _i6.Future<_i4.UserProfileModel>);
}
