// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselWidget extends StatelessWidget {
  final List<String> urls;

  const CarouselWidget({
    Key? key,
    required this.urls,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: urls.length,
          itemBuilder: ((context, index, realIndex) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildImage(urls[index], index),
                const SizedBox(
                  height: 10,
                ),
                Text('Photo $index')
              ],
            );
          }),
          options: CarouselOptions(height: 400),
        ),
      ],
    );
  }

  Widget buildImage(String url, int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: SizedBox(
          height: 300,
          child: Image.network(
            url,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
