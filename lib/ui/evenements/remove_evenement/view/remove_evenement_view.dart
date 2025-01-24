import 'package:flutter/material.dart';
import 'package:mycs/ui/evenements/remove_evenement/view/Remove_evenement_list.dart';
import '../../../common/widgets/custom_appbar.dart';

class RemoveEvenementView extends StatelessWidget {
  const RemoveEvenementView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: const CustomAppBar(title: ''),
      drawer: size.width <= 745 ? CustomDrawer() : null,
      body: RemoveEvenementLis() ,

    );


  }
}