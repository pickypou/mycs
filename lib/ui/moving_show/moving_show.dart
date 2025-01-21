import 'package:flutter/material.dart';
import 'package:mycs/ui/common/widgets/custom_appbar.dart';
import 'package:mycs/ui/common/widgets/footer.dart';
import 'package:mycs/ui/theme.dart';

import '../common/widgets/img_moving.dart';

class MovingShow extends StatelessWidget {
  const MovingShow({super.key});

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
                    "Moving Show",
                    style: titleStyleLarge(context),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ImgMoving(),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Sport d'expression, le Moving se montre et permet à celles et ceux qui le souhaitent de se dépasser par l'apprentissage et la construction de suites (chorégraphies) de Moving ajoutant aux qualités du Moving, le travail en groupe et les représentations sur scène.",
                  style: textStyleText(context),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "5 catégories d'âge, dès 6 ans et jusqu'aux adultes et seniors",
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
                    "Moving Show",
                    style: titleStyleMedium(context),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ImgMoving(),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Sport d'expression, le Moving se montre et permet à celles et ceux qui le souhaitent de se dépasser par l'apprentissage et la construction de suites (chorégraphies) de Moving ajoutant aux qualités du Moving, le travail en groupe et les représentations sur scène.",
                  style: textStyleText(context),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "5 catégories d'âge, dès 6 ans et jusqu'aux adultes et seniors",
                  style: textStyleTextAccueil(context),
                ),
              ],
            ),
          )),
          bottomNavigationBar: Footer());
    }
  }
}
