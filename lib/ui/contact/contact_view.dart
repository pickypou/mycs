import 'package:flutter/material.dart';
import 'package:mycs/ui/common/widgets/clickable_image.dart';
import 'package:mycs/ui/common/widgets/footer.dart';
import 'package:mycs/ui/contact/form_contact.dart';
import 'package:mycs/ui/theme.dart';

import '../common/widgets/custom_appbar.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    if (size.width < 749) {
      // Affichage pour petits écrans
      return Scaffold(
        appBar: const CustomAppBar(title: ''),
        drawer: size.width <= 745 ? CustomDrawer() : null,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 25),
                Text("Nous contacter", style: titleStyleMedium(context)),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClickableImage(
                      imagePath: 'assets/images/facebook.png',
                      url: 'https://www.facebook.com/search/top?q=mycs',
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Suivez-nous sur Facebook',
                      style: textStyleText(context),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                SizedBox(width: size.width, child: FormContact()),
                const SizedBox(height: 25),
                Image.asset('assets/images/dojo.png'),
                const SizedBox(height: 10),
                Text(
                  'Nous sommes situés au dojo Seclinois, parc des époux Rosenberg (Château Guillemaud)',
                  style: textStyleText(context),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  'Près du boulodrome',
                  style: textStyleText(context),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 25),
                Text(
                  "N° d'agrément Jeunesse et Sport : 59s2",
                  style: textStyleTextAccueil(context),
                ),
                const SizedBox(height: 55),
                Footer(),
              ],
            ),
          ),
        ),
      );
    } else {
      // Affichage pour grands écrans
      return Scaffold(
        appBar: const CustomAppBar(title: ''),
        drawer: size.width <= 745 ? CustomDrawer() : null,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 25),
                Align(
                  alignment: Alignment.center,
                  child:  Text("Nous contacter", style: titleStyleMedium(context)),
                ),

                const SizedBox(height: 25),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Section gauche : Images
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ClickableImage(
                                imagePath: 'assets/images/facebook.png',
                                url: 'https://www.facebook.com/search/top?q=mycs',
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Suivez-nous sur Facebook',
                                style: textStyleText(context),
                              ),
                            ],
                          ),

                          const SizedBox(height: 35),
                          Image.asset('assets/images/dojo.png'),
                          const SizedBox(height: 10),
                          Text(
                            'Nous sommes situés au dojo Seclinois, parc des époux Rosenberg (Château Guillemaud)',
                            style: textStyleText(context),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Près du boulodrome',
                            style: textStyleText(context),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 50),
                    // Section droite : Formulaire
                    Expanded(
                      flex: 2,

                      child:
                      FormContact(),
                    ),
                  ],
                ),

                const SizedBox(height: 70),
                Footer(),
              ],
            ),
          ),
        ),
      );
    }
  }
}
