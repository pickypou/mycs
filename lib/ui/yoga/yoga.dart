import 'package:flutter/material.dart';
import 'package:mycs/ui/common/widgets/footer.dart';

import '../common/widgets/custom_appbar.dart';
import '../common/widgets/img_step.dart';
import '../theme.dart';

class Yoga extends StatelessWidget {
  const Yoga({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                    "Yoga",
                    style: titleStyleMedium(context),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
               Image.asset('assets/images/yoga/yoga_1.jpeg', fit: BoxFit.contain,width: size.width*0.3,),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Le Yoga est pratiqué au MYCS, un des meilleurs clubs régionaux dans ce domaine, depuis plus de 20 ans. Les cours, au nombre de 3, sont encadrés par deux professeures diplômées de ronommée. Deux ont lieu en soirée et un l'après-midi. le style Hatha-Yoga, le plus universel, repose sur des postures physiques, des pratiques respiratoires et de la relaxation, visant l'union du corps et de l'esprit, et apportant un mieux-être indéniable",
                  style: textStyleText(context),
                ),
                const SizedBox(
                  height: 40,
                ),
                Image.asset('assets/images/divider_2.png', fit: BoxFit.contain,width: size.width*0.4,),
                const SizedBox(
                  height: 40,
                ),
                Text('QI GONG', style: titleStyleMedium(context),),

                Image.asset('assets/images/gong/qi_gong.png', fit: BoxFit.contain,width: size.width*0.3,),
                const SizedBox(
                  height: 20,
                ),
                Text("Le QI GONG est une pratique traditionnelle chinoise qui vise à cultiver et équilibrer l'énergie vitale, appelée le Qi(chi), associée à la respiration consciente et à la méditation.",
                style: textStyleText(context),),
                const SizedBox(
                  height: 40,
                ),
Footer()


              ],
            ),
          )),

    );
  }
}
