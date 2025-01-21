import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ClickableImage extends StatelessWidget {
  final String imagePath;
  final String route;

  const ClickableImage({
    super.key,
    required this.imagePath,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          // Navigation vers la route spécifiée
          context.go(route);
        },
        child: Image.asset(
          imagePath,
          width: 75,
          height: 75, // Ajustez la taille selon vos besoins
        ),
      ),
    );
  }
}
