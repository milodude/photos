import 'package:flutter/material.dart';

class TopTitleMobile extends StatelessWidget {
  const TopTitleMobile({
    Key? key,
    required this.width,
    required this.heigth,
  }) : super(key: key);

  final double width;
  final double heigth;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      width: width,
      height: heigth * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      height: 6,
                      child: Icon(
                        Icons.remove,
                        size: 34,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5, bottom: 25),
                      child: Icon(
                        Icons.remove,
                        size: 34,
                      ),
                    ),
                  ],
                ),
              )),
          const Expanded(
            flex: 9,
            child: Center(
                child: Text(
              'Discover',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            )),
          ),
        ],
      ),
    );
  }
}
