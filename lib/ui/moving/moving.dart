import 'package:flutter/material.dart';
import 'package:mycs/ui/common/widgets/custom_appbar.dart';
import 'package:mycs/ui/common/widgets/footer.dart';
import 'package:mycs/ui/common/widgets/img_moving.dart';
import 'package:mycs/ui/theme.dart';

class Moving extends StatelessWidget {
  const Moving({super.key});

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
                      child: Text("Moving", style: titleStyleLarge(context),),
                    ),
                    const SizedBox(height: 15,),
                    Text("Sport d'expression, Sport d'exeption",style: textStyleTextAccueil(context).copyWith(fontSize: size.width/20)),
                    Text("Moving, Sport, Art et Technique", style: textStyleTextAccueil(context).copyWith(fontSize: size.width/20),),
                    const SizedBox(height: 20,),
                    ImgMoving(),
                    const SizedBox(height: 20,),
                    Text("Sport inventé à Seclin par Didier SERRURIER dans les années 80 et qui a traversé les océans, le moving et ses dérivés apportent tonus, condition physique, équilibre, coordination et rythme, efficacité musculaire, dynamisme général. Le tout sur musiques variées. Recommandé également en complément pour les pratiquants de toutes nos autres disciplines et excellente base pour la pratique de nombreux autres sports.",
                      style: textStyleText(context),),
                    Text("Créé à Seclin, le Moving a éssaimé en france métropolitaine, dans les DOM TOM : Guadeloupe, Martinique, Guyane ainsi qu'au Royaume-Uni, en Belgique, en Hongrie, en Allemagne.",
                      style: textStyleText(context),),
                    const SizedBox(height: 30,),
                    Text("5 catégories d'âge, dès 6 ans et jusqu'aux adultes et seniors",style: textStyleTextAccueil(context),),
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
                      child: Text("Moving", style: titleStyleMedium(context),),
                    ),
                    const SizedBox(height: 15,),
                    Text("Sport d'expression, Sport d'exeption",style: titleStyleSmall(context)),
                    Text("Moving, Sport, Art et Technique", style: titleStyleSmall(context),),
                    const SizedBox(height: 30,),
                    ImgMoving(),
                    const SizedBox(height: 35,),
                    Text("Sport inventé à Seclin par Didier SERRURIER dans les années 80 et qui a traversé les océans, le moving et ses dérivés apportent tonus, condition physique, équilibre, coordination et rythme, efficacité musculaire, dynamisme général. Le tout sur musiques variées. Recommandé également en complément pour les pratiquants de toutes nos autres disciplines et excellente base pour la pratique de nombreux autres sports.",
                    style: textStyleText(context),),
                    Text("Créé à Seclin, le Moving a éssaimé en france métropolitaine, dans les DOM TOM : Guadeloupe, Martinique, Guyane ainsi qu'au Royaume-Uni, en Belgique, en Hongrie, en Allemagne.",
                    style: textStyleText(context),),
                    const SizedBox(height: 30,),
                    Text("5 catégories d'âge, dès 6 ans et jusqu'aux adultes et seniors",style: textStyleTextAccueil(context),),
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
