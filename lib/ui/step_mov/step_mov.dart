import 'package:flutter/material.dart';
import 'package:mycs/ui/common/widgets/custom_appbar.dart';
import 'package:mycs/ui/common/widgets/footer.dart';
import 'package:mycs/ui/common/widgets/img_step.dart';
import 'package:mycs/ui/theme.dart';

class StepMov extends StatelessWidget {
  const StepMov({super.key});

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
                    "Step Mov",
                    style: titleStyleLarge(context),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ImgStep(),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "L'alliance d'une troisième dimension avec l'utilisation du Step pour la pratique d'un Moving différent. Dynamisme, équilibre, renforcement des membres inferieurs dans une ambiance musicale rythmée.",
                  style: textStyleText(context),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Adultes et dès 15 ans",
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
                    "Step Mov",
                    style: titleStyleMedium(context),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/step/step_1.jpeg",
                      fit: BoxFit.contain,
                      width: size.width * 0.3,
                      height: size.height * 0.4,
                    ),
                    const SizedBox(
                      width: 55,
                    ),
                    Image.asset(
                      "assets/images/step/step_2.jpeg",
                      fit: BoxFit.contain,
                      width: size.width * 0.3,
                      height: size.height * 0.3,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "L'alliance d'une troisième dimension avec l'utilisation du Step pour la pratique d'un Moving différent. Dynamisme, équilibre, renforcement des membres inferieurs dans une ambiance musicale rythmée.",
                  style: textStyleText(context),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Adultes et dès 15 ans",
                  style: textStyleTextAccueil(context),
                ),
              ],
            ),
          )),
          bottomNavigationBar: Footer());
    }
  }
}
