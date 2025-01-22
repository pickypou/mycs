import 'package:flutter/material.dart';
import 'package:mycs/ui/theme.dart';

class CardPlanning extends StatelessWidget {
  final String title;
  final String jour_1;
  final String heures_1;
  final String categories_1;
  final String? jour_2;
  final String? heures_2;
  final String? categories_2;
  final String? jour_3;
  final String? heures_3;
  final String? categories_3;
  final String? jour_4;
  final String? heures_4;
  final String? categories_4;
  final String? jour_5;
  final String? heures_5;
  final String? categories_5;
  final double? fontSize;

  const CardPlanning({
    super.key,
    required this.title,
    required this.jour_1,
    required this.heures_1,
    required this.categories_1,
     this.jour_2,
     this.heures_2,
     this.categories_2,
    this.jour_3,
    this.heures_3,
    this.categories_3,
    this.jour_4,
    this.heures_4,
    this.categories_4,
    this.jour_5,
    this.heures_5,
    this.categories_5,
    this.fontSize
  });

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.sizeOf(context);
    // Largeur dynamique de la carte
    final double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
        width: screenWidth <749 ? size.width * 1 : size.width * 0.5,
        child:Card(
      elevation: 0,
      color: Colors.transparent, // Fond transparent
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(
          color: Theme.of(context).colorScheme.surface,
        ),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth <749 ? 0 : 20, // Marges dynamiques
        vertical: 10,
      ),
      child: Padding(
        padding: const EdgeInsets.all(5), // Espacement interne des contenus
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                title,
                style: titleStyleSmall(context),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 12),
            _buildRow(context, jour_1, heures_1, categories_1),
            if (jour_2 != null) _buildRow(context, jour_2!, heures_2!, categories_2!),
            if (jour_3 != null) _buildRow(context, jour_3!, heures_3!, categories_3!),
            if (jour_4 != null) _buildRow(context, jour_4!, heures_4!, categories_4!),
            if (jour_5 != null) _buildRow(context, jour_5!, heures_5!, categories_5!),
          ],
        ),
      ),
        )
    );
  }

  // Fonction pour afficher les lignes dynamiquement
  Widget _buildRow(BuildContext context, String jour, String heures, String categories) {
    Size size =MediaQuery.sizeOf(context);
    double calculatedFontSize =
        fontSize ?? (size.width > 749 ? size.width / 95 : 14);
    return
      Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 2,
            child: Text(
              jour,
              style: textStyleText(context).copyWith(fontSize: calculatedFontSize),
            ),
          ),
          const SizedBox(width: 8),
          Flexible(
            flex: 3,
            child: Text(
              heures,
              style: textStyleText(context).copyWith(fontSize: calculatedFontSize),
            ),
          ),
          const SizedBox(width: 8),
          Flexible(
            flex: 4,
            child: Text(
              categories,
              style: textStyleText(context).copyWith(fontSize: calculatedFontSize),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
