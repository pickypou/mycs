import 'package:flutter/material.dart';
import 'package:mycs/ui/common/widgets/img_header.dart';
import '../common/widgets/custom_appbar.dart';
import '../common/widgets/footer.dart';
import '../theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    if (size.width < 749) {
      return Scaffold(
          appBar: const CustomAppBar(title: ''),
          drawer: MediaQuery.of(context).size.width <= 750
              ? const CustomDrawer()
              : null,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 25, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'MYCS',
                    style: titleStyleLarge(context),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                   Text(
                      "Le CLUB POUR TOUTES ET TOUS",
                      textAlign: TextAlign.center,
                      style: titleStyleMedium(context),
                    ),
                  const SizedBox(
                    height: 25,
                  ),
              ImgHeader(),
              Align(
                alignment: Alignment.topLeft,
                child:
                  Text(
                    "MYCS :",
                    style: titleStyleSmall(context),
                  )),

                  Text(
                    "1 sigle pour 4 mots: Moving Yoga Combat Seclin.",
                    style: textStyleText(context),
                  ),
                  Text(
                    "4 mots pour 8 disciplines: Moving, Zen Moving, Setp Mov', Moving Show, Box américaine et kick boxing, Capoeira et  Yoga.",
                    style: textStyleText(context),
                  ),
                  Text("6 jours de fonctionnement du lundi au samedi.",style: textStyleText(context)),
                  Text("12 encadrants pour une équipe compétente et ultra motivée !", style: textStyleText(context)),
                  Text(
                    "50 pour 50 années d'existance de ce club d'aujourd'hui !",
                    style: textStyleText(context),
                  ),
                  Text(
                    "Un club cinquantenaire pour tous les âges et tous les niveaux.",
                    style: textStyleText(context),
                  ),
                    Text(
                      "A partir de 6 ans jusqu'à...tout l'temps!!!",
                      style: textStyleText(context),
                  ),
                  const SizedBox(
                    height: 55,
                  ),
                  const Footer()
                ],
              ),
            ),
          ));
    } else {
      return Scaffold(
        appBar: const CustomAppBar(title: ''),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 50, 25, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "MYCS",
                  style: titleStyleLarge(context),
                ),
                const SizedBox(
                  height: 35,
                ),
                Text(
                  'UN CLUB POUR TOUTES ET TOUS',
                  style: titleStyleMedium(context),
                ),
                const SizedBox(
                  height: 35,
                ),
                ImgHeader(),
                const SizedBox(height: 35,),
                Align(
                    alignment: Alignment.topLeft,
                    child:
                    Text(
                      "MYCS :",
                      style: titleStyleSmall(context),
                    )),
                const SizedBox(height: 35,),

                Text(
                  "1 sigle pour 4 mots: Moving Yoga Combat Seclin.",
                  style: textStyleText(context),
                ),
                Text(
                  "4 mots pour 8 disciplines: Moving, Zen Moving, Setp Mov', Moving Show, ",
                  style: textStyleText(context),
                ),
                Text(
                  "Box américaine et kick boxing, Capoeira et  Yoga.",
                  style: textStyleText(context),
                ),
                Text("6 jours de fonctionnement du lundi au samedi.",style: textStyleText(context)),
                Text("12 encadrants pour une équipe compétente et ultra motivée !", style: textStyleText(context)),
                Text(
                  "50 pour 50 années d'existance de ce club d'aujourd'hui !",
                  style: textStyleText(context),
                ),
                Text(
                  "Un club cinquantenaire pour tous les âges et tous les niveaux.",
                  style: textStyleText(context),
                ),
                Text(
                  "A partir de 6 ans jusqu'à...tout l'temps!!!",
                  style: textStyleText(context),
                ),
                const SizedBox(
                  height: 55,
                ),
                const Footer()
              ],
            ),
          ),
        ),
      );
    }
  }
}
