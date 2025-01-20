import 'package:flutter/material.dart';
import '../../theme.dart';

class Footer extends StatelessWidget {
  final double? fontSize;
  const Footer({super.key, this.fontSize});

  @override
  Widget build(BuildContext context) {
Size size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Divider(
          color: theme.colorScheme.primary,
          thickness: 1,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("assets/images/logo.png", fit: BoxFit.contain,width: size.width /15,),
              Text("© 2025 MYCS tous droits réservés", style: textStyleText(context)),

            ],
          ),
        ),
      ],
    );
  }
}