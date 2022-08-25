// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BackIconButton extends StatelessWidget {
  final Color buttonColor;
  final Function backAction;

  const BackIconButton({
    Key? key,
    required this.buttonColor,
    required this.backAction,
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
          backAction(context);
        });
  }
}
