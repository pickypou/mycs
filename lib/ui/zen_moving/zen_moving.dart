import 'package:flutter/material.dart';
import 'package:mycs/ui/common/widgets/custom_appbar.dart';
import 'package:mycs/ui/common/widgets/footer.dart';
import 'package:mycs/ui/theme.dart';

import '../common/widgets/img_zen_moving.dart';

class ZenMoving extends StatelessWidget {
  const ZenMoving({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    if(size.width < 749) {
      return Scaffold(
          appBar: const CustomAppBar(title: ''),
          drawer: MediaQuery
              .of(context)
              .size
              .width <= 745
              ? CustomDrawer()
              : null,
          body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 50, 25, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text("Zen-Moving", style: titleStyleLarge(context),),
                    ),

                    const SizedBox(height: 20,),
                    ImgZenMoving(),
                    const SizedBox(height: 20,),
                    Text("Parfois qualifié de Taï Chi à l'occidentale, il est vrai que le Zen Moving agit fortement sur le mental, bien-être physique et psychique, par la pratique lente à base de techniques du Moving et de disciplines extrême-orientales amenant au dépassement et à la maîtrise de soi, la prise de conscience de son schéma corporel, l'équilibre postural, la confiance en soi, la flexibilité mentale par l'assouplissement corporel.",
                      style: textStyleText(context),),
                    const SizedBox(height: 20,),
                    Text("Adultes et dès 15 ans",style: textStyleTextAccueil(context),),
                    const SizedBox(height: 55,),

                    Footer()


                  ],
                ),
              )
          )
      );
    } else {
      return Scaffold(
          appBar: const CustomAppBar(title: ''),
          drawer: MediaQuery
              .of(context)
              .size
              .width <= 745
              ? CustomDrawer()
              : null,
          body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 50, 25, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text("Zen-Moving", style: titleStyleMedium(context),),
                    ),

                    const SizedBox(height: 30,),
                    ImgZenMoving(),
                    const SizedBox(height: 35,),
                    Text("Parfois qualifié de Taï Chi à l'occidentale, il est vrai que le Zen Moving agit fortement sur le mental, bien-être physique et psychique, par la pratique lente à base de techniques du Moving et de disciplines extrême-orientales amenant au dépassement et à la maîtrise de soi, la prise de conscience de son schéma corporel, l'équilibre postural, la confiance en soi, la flexibilité mentale par l'assouplissement corporel.",
                      style: textStyleText(context),),
                    const SizedBox(height: 30,),
                    Text("Adultes et dès 15 ans",style: textStyleTextAccueil(context),),
                    const SizedBox(height: 55,),

                    Footer()
                  ],
                ),
              )
          )
      );
    }
  }
}
