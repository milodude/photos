import 'package:flutter/material.dart';

class MyProfileMyPhotosTitle extends StatelessWidget {
  const MyProfileMyPhotosTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'My Photos',
      style: TextStyle(
          fontSize: 42, color: Colors.black, fontWeight: FontWeight.bold),
    );
  }
}
