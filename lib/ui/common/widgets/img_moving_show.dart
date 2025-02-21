import 'package:flutter/material.dart';
import 'package:flutter_utils/flutter_utils.dart';

class ImgMovingShow extends StatelessWidget {
  ImgMovingShow({super.key});

  final List<String> images = [
    'assets/images/moving/moving_1.jpeg',
    'assets/images/moving/moving_2.jpeg',
    'assets/images/moving/moving_3.jpeg',
    'assets/images/moving/moving_4.jpeg',
    'assets/images/moving/moving_5.jpeg',
    'assets/images/moving/moving_6.jpeg',
    'assets/images/moving/moving_7.jpeg',
    'assets/images/moving/moving_8.jpeg',
    'assets/images/moving/moving_9.png',
    'assets/images/moving/moving_10.png',
    'assets/images/moving/moving_11.png',
    'assets/images/moving/moving_12.png',
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
            fraction: 0.7,
            imageUrl: images,
            autoPlay: true,
            isFromAssets: true,
          ));
    }
  }
}
