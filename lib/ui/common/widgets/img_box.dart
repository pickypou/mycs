import 'package:flutter/material.dart';
import 'package:flutter_utils/flutter_utils.dart';

class ImgBox extends StatelessWidget {
  ImgBox({super.key});

  final List<String> images = [
    'assets/images/box/box_1.jpg',
    'assets/images/box/box_2.jpg',
    'assets/images/box/box_3.jpg',
    'assets/images/box/box_4.jpg',
    'assets/images/box/box_5.jpg',
    'assets/images/box/box_6.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    if (size.width < 750) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: ImageSlider(
          imagePaths: images,
          useFadeTransition: true,
          duration: const Duration(seconds: 3),
          curve: Curves.easeInOut,
          width: 400,
        ),
      );
    } else {
      return Padding(
          padding: const EdgeInsets.all(20),
          child: ImageCarousel(
            height: 350,
            fraction: 0.9,
            imageUrl: images,
            autoPlay: true,
            isFromAssets: true,
          ));
    }
  }
}
