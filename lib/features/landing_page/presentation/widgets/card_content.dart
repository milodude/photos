import 'package:flutter/material.dart';

import '../../domain/entities/photo.dart';

class CardContent extends StatelessWidget {
  final Photo photo;

  const CardContent({
    Key? key,
    required this.photo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      key: const Key('SliverCard'),
      child: Hero(
        tag: photo.photoId.toString(),
        child: Material(
          child: InkWell(
            key: const Key('SliverInkwell'),
            onTap: () {
              //TODO: need to show details
              // Modular.to
              //     .pushNamed('$imageDetailsPageRouteName/${photo.photoId}');
              //ImageDetails(photo: photo);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: GridTile(
                key: const Key('SliverGridTile'),
                footer: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        photo.photoDescription,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '${photo.likes.toString()} votos',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 8),
                      ),
                      const SizedBox(height: 10)
                    ],
                  ),
                ),
                child: Image.network(
                  photo.photoUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
