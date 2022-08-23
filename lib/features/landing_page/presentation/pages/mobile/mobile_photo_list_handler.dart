import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greisy_photos/features/landing_page/presentation/bloc/photo/photo_bloc.dart';

import 'mobile_photo_grid_view.dart';

///Widget that renders a list of photos
class MobilePhotoListHandler extends StatefulWidget {
  ///Copnstructor that takes a showService as a parameter
  const MobilePhotoListHandler({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PhotoState createState() => _PhotoState();
}

class _PhotoState extends State<MobilePhotoListHandler> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          BlocBuilder<PhotoBloc, PhotoState>(builder: (
            BuildContext context,
            PhotoState state,
          ) {
            if (state is Initial) {
              context.read<PhotoBloc>().add(const GetPhotosEvent());
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  CircularProgressIndicator(),
                ],
              );
            } else if (state is Loading) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  CircularProgressIndicator(),
                ],
              );
            } else if (state is Loaded) {
              return PhotosGridView(photosList: state.photoList);
            } else if (state is Error) {
              return const Center(child: Text('Could not load photos'));
            }

            return const Text('Bloc error while loading data');
          })
        ],
      ),
    );
  }
}
