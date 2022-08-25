import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:greisy_photos/core/common_widgets/back_icon_button.dart';

import 'package:greisy_photos/features/landing_page/domain/entities/photo.dart';

import '../../../../../core/constants/routes.dart';

class MobilePhotoDetailsPage extends StatelessWidget {
  final Photo photoDetails;

  const MobilePhotoDetailsPage({
    Key? key,
    required this.photoDetails,
  }) : super(key: key);

  void backButtonAction(BuildContext context) {
    Modular.to.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    var heigth = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Stack(
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
              child: BackIconButton(
                buttonColor: Colors.white,
                backAction: backButtonAction,
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
                  subtitle: Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: GestureDetector(
                      onTap: () {
                        Modular.to.pushNamed(
                            '$userProfilePageRouteName/${photoDetails.userName}');
                      },
                      child: const Text('View profile',
                          style: TextStyle(fontSize: 12, color: Colors.white)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
