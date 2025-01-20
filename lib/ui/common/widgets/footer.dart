import 'package:flutter/material.dart';
import '../../theme.dart';

class Footer extends StatelessWidget {
  final double? fontSize;
  const Footer({super.key, this.fontSize});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 56.0), // Hauteur maximale fixée
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            color: theme.colorScheme.primary,
            thickness: 1,
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.contain,
                    width: size.width / 15,
                  ),
                  Flexible(
                    child: Text(
                      "© 2025 MYCS tous droits réservés",
                      style: textStyleText(context),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}