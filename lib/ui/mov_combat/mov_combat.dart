import 'package:flutter/material.dart';
import 'package:mycs/ui/common/widgets/custom_appbar.dart';
import 'package:mycs/ui/common/widgets/footer.dart';
import 'package:mycs/ui/common/widgets/img_box.dart';
import 'package:mycs/ui/common/widgets/img_capoeira.dart';
import 'package:mycs/ui/theme.dart';


class MovCombat extends StatelessWidget {
  const MovCombat({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    if (size.width < 749) {
      return Scaffold(
          appBar: const CustomAppBar(title: ''),
          drawer:
          MediaQuery.of(context).size.width <= 745 ? CustomDrawer() : null,
          body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 50, 25, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Mov'Combat",
                        style: titleStyleLarge(context),
                      ),
                    ),
                    Text(
                        "Sport de cotact, sport pour la niaque",
                        style: textStyleTextAccueil(context),
                      ),
                    const SizedBox(height: 20,),
                    Text(
                      "Boxe Américaine : ",
                      style: titleStyleMedium(context),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ImgBox(),
                    const SizedBox(
                      height: 20,
                    ),



                    const SizedBox(
                      height: 20,
                    ),
                    Text("Depuis 1976 à Seclin, la boxe Américaine est pratiquée au MYCS pour le loisir, le combat et la condition physique.",
                    style: textStyleText(context).copyWith(fontWeight: FontWeight.bold),),
                    Text("Apparue en france dans la seconde moitié des seventies, la boxe Américaine (ex Full-Contact) s'est imposée comme l'élément moteur des sports pieds-poings. De la catégorie des boxes pieds-poings, en plus de son aspect sportif, la boxe américaine constitue un moyen de self-défense redoutable. Elle permet d'acquérir une grande souplesse en même temps que renforcement musculaire et vitesse d'exécution, gage de puissance.",
                      style: textStyleText(context),),
                    const SizedBox(height: 30,),
                    Text(
                      "Adultes et dès 6 ans - 5 cours hebdomadaires",
                      style: textStyleTextAccueil(context),
                    ),
                    const SizedBox(height: 30,),

                    // PARTIE CAPOEIRA
                    Image.asset('assets/images/divider_2.png'),
                    const SizedBox(height: 30,),

                    Text(
                      "Capoeira : ",
                      style: titleStyleMedium(context),
                    ),
                    ImgCapoeira(),
                    const SizedBox(
                      height: 20,
                    ),

                    Text("Art de lutte brésilien exécuté sur un rythme et avec des instruments du Brésil, c'est un sport qui utilise toutes les parties du corps, amène une détente de l'esprit et une certaine philosophie de la vie tout en développant le sens du rythme. Elle apprend à réagir rapidement pour éviter ou attaquer son adversaire. Elle améliore la vitesse, les reflexes et l'agilité, tout en agisant fortement sur l'équilibre. Nos séances sont encadrées par un maître brésilien.",
                      style: textStyleText(context),),

                    const SizedBox(height: 30,),
                    Text(
                      "Adultes et dès 6 ans",
                      style: textStyleTextAccueil(context),
                    ),

                  ],
                ),
              )),
          bottomNavigationBar: Footer());
    } else {
      return Scaffold(
          appBar: const CustomAppBar(title: ''),
          drawer:
          MediaQuery.of(context).size.width <= 745 ? CustomDrawer() : null,
          body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 50, 25, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Mov'Combat",
                        style: titleStyleMedium(context),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Sport de contact, sport pour la niaque",
                        style: titleStyleSmall(context),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Boxe Américaine  ",
                      style: titleStyleMedium(context),
                    ),
                   ImgBox(),
                    const SizedBox(
                      height: 20,
                    ),


                    Text("Depuis 1976 à Seclin, la boxe Américaine est pratiquée au MYCS pour le loisir, le combat et la condition physique.",
                      style: textStyleText(context).copyWith(fontWeight: FontWeight.bold),),
                    Text("Apparu en france dans la seconde moitié des seventies, la boxe Américaine (ex Full-Contact) s'est imposée comme l'élément moteur des sports pieds-poings. De la catégorie des boxes pieds-poings, en plus de son aspect sportif, la boxe américaine constitue un moyen de self-défense redoutable. Elle permet d'acquérir une grande souplesse en même temps que renforcement musculaire et vitesse d'exécution, gage de puissance.",
                      style: textStyleText(context),),
                    const SizedBox(height: 30,),
                    Text(
                      "Adultes et dès 6 ans - 5 cours hebdomadaires",
                      style: textStyleTextAccueil(context),
                    ),
                    const SizedBox(height: 30,),
                    // PARTIE CAPOEIRA
                    Image.asset('assets/images/divider_2.png'),
                    const SizedBox(height: 30,),

                    Text(
                      "Capoeira : ",
                      style: titleStyleMedium(context),
                    ),
                    ImgCapoeira(),
                    const SizedBox(
                      height: 20,
                    ),

                    Text("Art de lutte brésilien exécuté sur un rythme et avec des instruments du Brésil, c'est un sport qui utilise toutes les parties du corps, amène une détente de l'esprit et une certaine philosophie de la vie tout en développant le sens du rythme. Elle apprend à réagir rapidement pour éviter ou attaquer son adversaire. Elle améliore la vitesse, les reflexes et l'agilité, tout en agisant fortement sur l'équilibre. Nos séances sont encadrées par un maître brésilien.",
                      style: textStyleText(context),),

                    const SizedBox(height: 30,),
                    Text(
                      "Adultes et dès 6 ans",
                      style: textStyleTextAccueil(context),
                    ),


                  ],
                ),
              )),
          bottomNavigationBar: Footer());
    }
  }
}
