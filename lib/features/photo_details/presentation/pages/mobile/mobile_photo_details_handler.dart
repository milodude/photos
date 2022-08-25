// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greisy_photos/features/photo_details/presentation/pages/mobile/mobile_photo_details_page.dart';

import '../../../../../core/common_widgets/error_page.dart';
import '../../bloc/photo_details/photo_details_bloc.dart';

///Widget that renders a photo details
class MobilePhotoDetailsHandler extends StatefulWidget {
  final String photoId;

  const MobilePhotoDetailsHandler({
    Key? key,
    required this.photoId,
  }) : super(key: key);

  @override
  State<MobilePhotoDetailsHandler> createState() =>
      _MobilePhotoDetailsHandlerState();
}

class _MobilePhotoDetailsHandlerState extends State<MobilePhotoDetailsHandler> {
  @override
  void initState() {
    ReadContext(context).read<PhotoDetailsBloc>().add(ClearPhotoDetailsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: BlocBuilder<PhotoDetailsBloc, PhotoDetailsState>(builder: (
        BuildContext context,
        PhotoDetailsState state,
      ) {
        if (state is PhotoDetailsInitial) {
          context
              .read<PhotoDetailsBloc>()
              .add(GetPhotoDetailsEvent(photoId: widget.photoId));
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              CircularProgressIndicator(),
            ],
          );
        } else if (state is PhotoDetailsLoading) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              CircularProgressIndicator(),
            ],
          );
        } else if (state is PhotoDetailsLoaded) {
          return MobilePhotoDetailsPage(photoDetails: state.photoDetails);
        } else if (state is Error) {
          return const ErrorPage();
        }

        return const ErrorPage();
      }),
    );
  }
}
