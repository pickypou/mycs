import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme = ThemeData(
  primaryColor: const Color(0xFFFAF6F1), // Couleur primaire
  scaffoldBackgroundColor: const Color(
      0xFFFAF6F1), // Couleur de fond par défaut (utilise primaryColor ou autre)
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFFFFB38E),
    onPrimary: Color(0xFF88C273),
    secondary: Color(0xFFFFE0B5),
    onSecondary: Color(0xFFFF0000),
    error: Color(0xFF000000),
    onError: Color(0xFFFFFFFF),
    surface: Color(  0xFFFAF6F1),
    onSurface: Color(0xFF198393),
  ),
);



// Style pour les titres avec la police Amable
TextStyle titleStyle(BuildContext context) {
  Size size = MediaQuery.sizeOf(context);
  double titlefont = size.width / 11;
  return TextStyle(
    fontSize: titlefont,
    color: theme.colorScheme.secondary,
    fontFamily: "Roboto", // Utilise la police Amable
    decoration: TextDecoration.none,
  );
}

TextStyle titleStyleLarge(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  double titleFontSize = size.width / 15;

  return TextStyle(
    fontSize: titleFontSize,
    fontWeight: FontWeight.bold,
    color: Theme.of(context).colorScheme.secondary,
    fontFamily: "Autography",
    decoration: TextDecoration.none,
  );

}

TextStyle titleStyleMedium(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  double titleFontSize = size.width / 27;

  return TextStyle(
    fontSize: titleFontSize,
    fontWeight: FontWeight.w400,
    color: Theme.of(context).colorScheme.secondary,
    fontFamily: "Autography", // Police Amable pour les grands titres
    decoration: TextDecoration.none,
  );
}

TextStyle titleStyleSmall(BuildContext context) {
  Size size = MediaQuery.sizeOf(context);
  double titleFontSize = size.width / 30;
  return TextStyle(
    fontSize: titleFontSize,
    fontWeight: FontWeight.w400,
    color: Theme.of(context).colorScheme.secondary,
    fontFamily: "Autography", // Police Amable pour les grands titres
    decoration: TextDecoration.none,
  );
}

// Style pour le texte avec la police Autography
TextStyle textStyleText(BuildContext context) {
  Size size = MediaQuery.sizeOf(context);
  double textFontSize = size.width / 75;
  return
    GoogleFonts.montserrat().copyWith(
      fontSize: textFontSize,
      color: Theme.of(context).colorScheme.secondary,
      decoration: TextDecoration.none,
    );
}

TextStyle textStyleTextAccueil(BuildContext context) {
  Size size = MediaQuery.sizeOf(context);
  double textFontSize = size.width / 55;
  return  GoogleFonts.montserrat().copyWith(
    fontSize: textFontSize,
    color: Theme.of(context).colorScheme.secondary,
    decoration: TextDecoration.none,
  );
}

TextStyle textStyleTextBulle(BuildContext context) {
  Size size = MediaQuery.sizeOf(context);
  double textFontSize = size.width / 88;
  return
    GoogleFonts.montserrat().copyWith(
      fontSize: textFontSize,
      color: Theme.of(context).colorScheme.secondary,
      decoration: TextDecoration.none,
    );
}

TextStyle? textStyleInput(BuildContext context, String inputText) {
  int baseFontSize = 15;
  double textFontSize =
  inputText.length > 20 ? baseFontSize - 1.2 : baseFontSize.toDouble();

  return  GoogleFonts.montserrat().copyWith(
    fontSize: textFontSize,
    fontWeight: FontWeight.bold,
    color: Theme.of(context).colorScheme.onSurface,
    decoration: TextDecoration.none,
  );
}