import 'package:flutter/material.dart';
import 'package:mycs/ui/common/widgets/footer.dart';
import '../../../common/widgets/custom_appbar.dart';
import 'evenement_list.dart';

class EvenementView extends StatelessWidget {
  const EvenementView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: const CustomAppBar(title: ''),
      drawer: size.width <= 745 ? CustomDrawer() : null,
      body: Column(
        mainAxisSize: MainAxisSize.max, // Utiliser tout l'espace vertical disponible
        children: [
          Expanded( // Permet à EvenementListView de prendre tout l'espace restant
            child: EvenementListView(),
          ),
          Footer(), // Reste toujours en bas
        ],
      ),
    );
  }
}
