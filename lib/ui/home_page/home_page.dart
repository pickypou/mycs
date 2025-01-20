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
                  Image.asset('assets/images/logo.png'),
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
                  const SizedBox(height: 15,),
                  Align(
                      alignment: Alignment.topLeft,
                      child:
                      Text(
                        "MYCS :",
                        style: textStyleTextAccueil(context),
                      )),
                  const SizedBox(height: 5,),

                  Text(
                    "1 sigle = 4 mots : Moving-Yoga-Combat-Seclin.",
                    style: textStyleText(context),
                  ),
                  Text(
                    "4 mots = pour 8 disciplines :",
                    style: textStyleText(context),
                  ),
                  Text("Moving", style: textStyleTextAccueil(context),),
                  Text("Zen Moving", style: textStyleTextAccueil(context)),
                  Text("Step Mov", style: textStyleTextAccueil(context)),
                  Text("Moving Show", style: textStyleTextAccueil(context)),
                  Text("Boxe américaine et kick boxing", style: textStyleTextAccueil(context)),
                  Text("Capoeira", style: textStyleTextAccueil(context)),
                  Text("Yoga", style: textStyleTextAccueil(context)),

                  Text("6 = 6 jours de fonctionnement du lundi au samedi.",style: textStyleText(context)),
                  Text("12 = 12 encadrants pour une équipe compétente et ultra motivée !", style: textStyleText(context)),
                  Text(
                    "50 = 50 années d'existence de ce club d'aujourd'hui !",
                    style: textStyleText(context),
                  ),
                  Text(
                    "Un club cinquantenaire pour tous les âges et tous les niveaux.",
                    style: textStyleTextAccueil(context),
                  ),
                  Text(
                    "A partir de 6 ans jusqu'à...tout l'temps ! ! !",
                    style: textStyleTextAccueil(context),
                  ),
                  const SizedBox(height: 30,),
                  Text("Votre club sport, santé, bien-être", style: textStyleTextAccueil(context),),
                  const SizedBox(
                    height: 55,
                  ),

                ],
              ),

            ),
          ),
          bottomNavigationBar: Footer()
      );
    } else {
      return Scaffold(
        appBar: const CustomAppBar(title: ''),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 50, 25, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/logo.png",
                fit: BoxFit.contain,width: size.width *0.5,),
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
                  "1 sigle = 4 mots : Moving-Yoga-Combat-Seclin.",
                  style: textStyleText(context),
                ),
                Text(
                  "4 mots = pour 8 disciplines :",
                  style: textStyleText(context),
                ),
                Text("Moving", style: titleStyleSmall(context),),
                Text("Zen Moving", style: titleStyleSmall(context)),
                Text("Step Mov", style: titleStyleSmall(context)),
                Text("Moving Show", style: titleStyleSmall(context)),
                Text("Boxe américaine et kick boxing", style: titleStyleSmall(context)),
                Text("Capoeira", style: titleStyleSmall(context)),
                Text("Yoga", style: titleStyleSmall(context)),

                Text("6 = 6 jours de fonctionnement du lundi au samedi.",style: textStyleText(context)),
                Text("12 = 12 encadrants pour une équipe compétente et ultra motivée !", style: textStyleText(context)),
                Text(
                  "50 = 50 années d'existence de ce club d'aujourd'hui !",
                  style: textStyleText(context),
                ),
                Text(
                  "Un club cinquantenaire pour tous les âges et tous les niveaux.",
                  style: titleStyleSmall(context),
                ),
                Text(
                  "A partir de 6 ans jusqu'à...tout l'temps ! ! !",
                  style: titleStyleSmall(context),
                ),
                const SizedBox(height: 30,),
                Text("Votre club sport, santé, bien-être", style: titleStyleSmall(context),),


              ],
            ),
          ),
        ),
          bottomNavigationBar: Footer()
      );
    }
  }
}
