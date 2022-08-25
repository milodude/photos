import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greisy_photos/core/common_widgets/error_page.dart';
import 'package:greisy_photos/features/user_profile/presentation/bloc/user_profile/user_profile_bloc.dart';

import '../pages/mobile/mobile_user_profile_page.dart';

class MobileUserProfileHandler extends StatefulWidget {
  final String userName;

  const MobileUserProfileHandler({
    Key? key,
    required this.userName,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<MobileUserProfileHandler> {
  @override
  void initState() {
    ReadContext(context).read<UserProfileBloc>().add(ClearUserProfileEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: BlocBuilder<UserProfileBloc, UserProfileState>(builder: (
        BuildContext context,
        UserProfileState state,
      ) {
        if (state is UserProfileInitial) {
          context
              .read<UserProfileBloc>()
              .add(GetUserProfileEvent(userName: widget.userName));
        } else if (state is UserProfileLoading) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              CircularProgressIndicator(),
            ],
          );
        } else if (state is UserProfileLoaded) {
          return MobileUserProfilePage(userProfile: state.userProfile);
        } else if (state is Error) {
          return const ErrorPage();
        }

        return const ErrorPage();
      }),
    );
  }
}
