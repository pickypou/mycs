import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../theme.dart';
import 'clickable_image.dart';

class Footer extends StatelessWidget {
  final double? fontSize;
  const Footer({super.key, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(
          color: theme.colorScheme.primary,
          thickness: 1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClickableImage(
                  imagePath: 'assets/images/logo.png',
                  route: "/admin"),
              Flexible(
                child: Text(
                  "© 2025 MYCS tous droits réservés",
                  style: textStyleText(context),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Flexible(
                child: Text(
                  "N° d'agrément Jeunesse et Sport 59s2",
                  style: textStyleTextAccueil(context),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              TextButton(
                  onPressed: () async {
                    final Uri url = Uri.parse('https://ludovicspysschaert.fr/');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url, mode: LaunchMode.externalApplication);
                    } else {
                      // Tu peux afficher une erreur ici
                      throw 'Impossible d’ouvrir l’URL : $url';
                    }
                  },
                  child: Text('création Ludovic SPYSSCHAERT',style: textStyleTextAccueil(context),
                overflow: TextOverflow.ellipsis,)),

              PopupMenuButton<String>(
                icon: Icon(Icons.info_outline, color: Colors.black), // Icône noire visible
                color: Colors.white, // Fond du menu
                onSelected: (value) {
                  if (value == 'mentions') {
                    launchUrl(Uri.parse('/mentions-legales.html'));
                  } else if (value == 'confidentialite') {
                    launchUrl(Uri.parse('/confidentialite.html'));
                  } else if (value == 'cookies') {
                    launchUrl(Uri.parse('/cookies.html'));
                  }
                },
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem<String>(
                    value: 'mentions',
                    child: Text(
                      'Mentions légales',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'confidentialite',
                    child: Text(
                      'Politique de confidentialité',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'cookies',
                    child: Text(
                      'Politique des cookies',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              )


            ],
          ),
        ),
      ],
    );

  }
}