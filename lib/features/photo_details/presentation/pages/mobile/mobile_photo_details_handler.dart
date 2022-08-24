// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greisy_photos/features/photo_details/presentation/pages/mobile/mobile_photo_details_page.dart';

import '../../bloc/photo_details/photo_details_bloc.dart';

///Widget that renders a photo details
class MobilePhotoListHandler extends StatefulWidget {
  final String photoId;

  const MobilePhotoListHandler({
    Key? key,
    required this.photoId,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PhotoState createState() => _PhotoState();
}

class _PhotoState extends State<MobilePhotoListHandler> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoDetailsBloc, PhotoDetailsState>(builder: (
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
        return MobilePhotodetailsPage(photoDetails: state.photoDetails);
      } else if (state is Error) {
        return const Center(child: Text('Could not load details'));
      }

      return const Text('Bloc error while loading data');
    });
  }
}
