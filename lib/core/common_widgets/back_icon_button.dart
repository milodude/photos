import 'package:flutter/material.dart';

class BackIconButton extends StatelessWidget {
  final Color buttonColor;
  const BackIconButton({
    Key? key,
    required this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(
        Icons.highlight_off,
        color: buttonColor,
        size: 37,
      ),
      onTap: () {
        Navigator.of(context).pop();
      },
    );
  }
}
