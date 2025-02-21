import 'package:flutter/material.dart';
import 'package:flutter_utils/flutter_utils.dart';

class ImgCapoeira extends StatelessWidget {
  ImgCapoeira({super.key});

  final List<String> images = [
    'assets/images/capoeira/capoeira_1.jpeg',
    'assets/images/capoeira/capoeira_2.png',
    'assets/images/capoeira/capoeira_3.jpg',
    'assets/images/capoeira/capoeira_4.jpg',
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
