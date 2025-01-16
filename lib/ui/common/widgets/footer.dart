import 'package:flutter/material.dart';
import '../../theme.dart';

class Footer extends StatelessWidget {
  final double? fontSize;
  const Footer({super.key, this.fontSize});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Divider(
          color: theme.colorScheme.secondary,
          thickness: 1,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("© 2025 MYCS tous droits réservés", style: textStyleText(context)),

            ],
          ),
        ),
      ],
    );
  }
}