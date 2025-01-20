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
            imageUrl: images,
            height: 350,
            fraction: 0.7,
            autoPlay: true,
            isFromAssets: true,
          ));
    } /*else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5), // Couleur de l'ombre
                  spreadRadius: 2, // Élargissement de l'ombre
                  blurRadius: 8, // Flou de l'ombre
                  offset: const Offset(4, 4), // Position de l'ombre
                ),
              ],
            ),
            child: Image.asset(
              'assets/images/moving/moving_7.jpeg',
              fit: BoxFit.contain,
              // height: 350,
              //width: size.width*0.3,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: const Offset(4, 4),
                ),
              ],
            ),
            child: Image.asset(
              'assets/images/box/box_2.jpg',
              fit: BoxFit.contain,
              height: 350,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: const Offset(4, 4),
                ),
              ],
            ),
            child: Image.asset(
              'assets/images/yoga/yoga_1.jpeg',
              fit: BoxFit.contain,
              height: 350,
            ),
          ),
        ],
      );
    }*/
  }
}