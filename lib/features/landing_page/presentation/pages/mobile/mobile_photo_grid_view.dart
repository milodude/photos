// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:greisy_photos/features/landing_page/domain/entities/photo.dart';
import 'package:greisy_photos/features/landing_page/presentation/bloc/photo/photo_bloc.dart';

import '../../../../../core/constants/routes.dart';
import '../../widgets/card_content.dart';

///Widget that shows you a list of shows
class PhotosGridView extends StatelessWidget {
  ///Constructor that takes  a list of shows.
  const PhotosGridView({
    Key? key,
    required this.photosList,
  }) : super(key: key);

  ///Parameter. A list of photos.
  final List<Photo> photosList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      key: const Key('expandedPhotoList'),
      child: photosList.isEmpty
          ? const Center(
              child: Text(
                'No photos found!',
                style: TextStyle(fontSize: 30),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(26),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 26,
                      crossAxisSpacing: 26,
                      mainAxisExtent: 215),
                  itemCount: photosList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CardContent(
                      photo: photosList[index],
                    );
                  }),
            ),
    );
  }
}
