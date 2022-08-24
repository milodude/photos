import 'package:flutter/material.dart';

import 'package:greisy_photos/features/landing_page/domain/entities/photo.dart';

class MobilePhotodetailsPage extends StatelessWidget {
  final Photo photoDetails;

  const MobilePhotodetailsPage({
    Key? key,
    required this.photoDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var heigth = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          // fit: StackFit.expand,
          children: [
            Positioned(
              child: SizedBox(
                height: heigth,
                width: width,
                child: Hero(
                  tag: photoDetails.photoId.toString(),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      photoDetails.photoUrl,
                      height: heigth,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 59,
              left: 26,
              child: GestureDetector(
                child: const Icon(
                  Icons.highlight_off,
                  color: Colors.white,
                  size: 37,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Positioned(
              top: heigth - heigth * 0.3,
              left: 26,
              child: Container(
                constraints: BoxConstraints(
                    maxWidth: width - width * 0.5, maxHeight: 80),
                child: Text(
                  photoDetails.photoDescription,
                  style: const TextStyle(color: Colors.white, fontSize: 42),
                ),
              ),
            ),
            Positioned(
              top: heigth - heigth * 0.18,
              left: 26,
              child: Text(
                '${photoDetails.likes} likes',
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
            Positioned(
                top: heigth - heigth * 0.17,
                left: 12,
                child: SizedBox(
                  width: width - width * 0.2,
                  child: ListTile(
                    leading: ClipOval(
                        child: Image.network(
                      photoDetails.profileImage,
                      scale: 0.7,
                    )),
                    title: Text(
                      photoDetails.name,
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    subtitle: const Padding(
                      padding: EdgeInsets.only(left: 4.0),
                      child: Text('View profile',
                          style: TextStyle(fontSize: 12, color: Colors.white)),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
