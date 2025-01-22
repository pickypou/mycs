import 'package:flutter/material.dart';
import 'package:mycs/ui/common/widgets/card_planning.dart';
import 'package:mycs/ui/common/widgets/footer.dart';
import 'package:mycs/ui/theme.dart';

import '../common/widgets/custom_appbar.dart';

class PlanningTable extends StatelessWidget {
  final double? fontSize;
  const PlanningTable({super.key, this.fontSize});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double calculatedFontSize =
        fontSize ?? (size.width > 749 ? size.width / 65 : 16);
      return Scaffold(
        appBar: const CustomAppBar(title: ''),
        drawer: size.width <= 745 ? CustomDrawer() : null,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Wrap(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child:
                    Text(
                      'Planning des cours',
                      style: titleStyleMedium(context), textAlign: TextAlign.center,
                    ),
                    ),
                    CardPlanning(
                      title: 'Moving',
                      jour_1: 'Mardi :',
                      heures_1: '18h15-18h55',
                      categories_1: 'Adultes(et à partir de 13 ans)',
                      jour_2: 'Mercredi : ',
                      heures_2: '14h20-15h15',
                      categories_2: 'POUSSINS:(6)7,8,9 ans',
                      jour_3: 'Mercredi : ',
                      heures_3: '15h00-16h10',
                      categories_3: 'MINIMES:(9)10,11,12 ans',
                      jour_4: 'Mercredi : ',
                      heures_4: '15h45-17h15',
                      categories_4: 'JEUNES 13 à 17 ans',
                      jour_5: 'Mercredi : ',
                      heures_5: '18h15-18h55',
                      categories_5: 'ADULTES et à partir de 15 ans',
                    ),
                    CardPlanning(
                      title: 'Moving Show',
                      jour_1: 'Mardi :',
                      heures_1: '18h55-19h25',
                      categories_1: 'Adultes(et à partir de 13 ans)',
                      jour_2: 'Mercredi : ',
                      heures_2: '18h00-18h15',
                      categories_2: 'ADULTES et à partir de15 ans',
                    ),
                    CardPlanning(
                      title: 'Zen Moving ',
                      jour_1: 'Mercredi :',
                      heures_1: '17h15-18h00',
                      categories_1: 'Adultes(et à partir de 15 ans)',
                    ),
                    CardPlanning(
                      title: 'Step Mov\' ',
                      jour_1: 'Mardi :',
                      heures_1: '19h25-19h55',
                      categories_1: 'Adultes(et à partir de 15 ans)',
                    ),
                    CardPlanning(
                      title: 'Compétition moving à la carte ',
                      jour_1: 'Mardi :',
                      heures_1: '17h15-18h00',
                      categories_1: 'Individuels, couple ou trio',
                    ),
                    CardPlanning(
                      title: 'Compétition moving ',
                      jour_1: 'Samedi :',
                      heures_1: '16h15-18h30',
                      categories_1: '12-15 ans à (16h15)/adulte à (17h45)',
                    ),
                    CardPlanning(
                      title: 'Yoga',
                      jour_1: 'Mardi :',
                      heures_1: '19h15-20h45',
                      categories_1: 'avancés',
                      jour_2: 'Jeudi',
                      heures_2: '18h30-19h45',
                      categories_2: 'débutants',
                    ),
                    CardPlanning(
                      title: 'Capoeira ',
                      jour_1: 'Vendredi :',
                      heures_1: '18h00-18h45',
                      categories_1: '6, 9 ans',
                      jour_2: 'Vendredi',
                      heures_2: '18h45-19h30',
                      categories_2: '10, 12 ans',
                      jour_3: 'Vendredi',
                      heures_3: '19h30-21h00',
                      categories_3: 'Adulte et à partir de 13 ans',
                    ),
                    CardPlanning(
                      title: 'Renforcement combat',
                      jour_1: 'Mercredi :',
                      heures_1: '20h30-21h30',
                      categories_1: 'adulte et à partir de 16 ans',
                    ),
                    CardPlanning(
                      title: 'Boxe américaine',
                      jour_1: 'Lundi :',
                      heures_1: '20h00-21h30',
                      categories_1: 'adultes et à partir de 16 ans',
                      jour_2: 'Mercredi',
                      heures_2: '19h00-20h30',
                      categories_2: 'adulte et à partir de 15 ans',
                      jour_3: 'Samedi',
                      heures_3: '14h00-15h00',
                      categories_3: '6, 11 ans',
                      jour_4: 'Samedi',
                      heures_4: '15h00-16h15',
                      categories_4: '12, 15 ans',
                    ),
                    const SizedBox(height: 35,),
                    Text('Tarifs',style: titleStyleMedium(context),),
                    const SizedBox(height: 10,),
                    Text("Adhésion au club : 35€ l'année.", style: textStyleText(context).copyWith(fontSize: calculatedFontSize),),
                    Text("Cotisation annuelle club : ", style: textStyleText(context).copyWith(fontSize: calculatedFontSize),),
                    Text(" selon l'âge et le lieu de domicile.", style: textStyleText(context).copyWith(fontSize: calculatedFontSize),),
                    Text("Seclinois :  entre 52 et 135€ .", style: textStyleTextAccueil(context),),
                    Text("non seclinois :  entre 67 et 140€.", style: textStyleTextAccueil(context),),
                    Text("Reduction familles : 20% sur la totalité.", style: textStyleTextAccueil(context).copyWith(color: Colors.redAccent),),
                    const SizedBox(height: 55,),
                    Footer()

                  ],
                )
              ],
            ),
          ),
        ),
      );
    }
  }

