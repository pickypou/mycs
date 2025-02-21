import 'package:flutter/material.dart';
import 'package:flutter_utils/flutter_utils.dart';

class ImgZenMoving extends StatelessWidget {
  ImgZenMoving({super.key});

  final List<String> images = [
    'assets/images/zen_moving/zen_moving_1.jpeg',
    'assets/images/zen_moving/zen_moving_2.jpeg',
    'assets/images/zen_moving/zen_moving_3.jpeg',
    'assets/images/zen_moving/zen_moving_4.jpeg',
    'assets/images/zen_moving/zen_moving_5.png',
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
          width: 800,
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
