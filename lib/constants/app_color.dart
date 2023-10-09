import 'package:flutter/material.dart';

const colorPrimary = Color(0xffCC3D36);
MaterialColor colorPrimaryAccent =
    const Color.fromRGBO(89, 116, 157, 1).toMaterialColor();
const erroColor = Color(0xFF808080);
const secondaryColor = Color.fromRGBO(250, 192, 226, 1);


const greenColor = Color(0xff0FA654);
const redColor = Color(0xffCC3D36);
const commonTextGreyColor = Color(0xFF7C7B7B);
const commonTextColor = Color.fromARGB(255, 59, 59, 59);
const commonTextLightColor = Color(0xFFE0E0E0);
const commonTextColorDark = Color.fromARGB(255, 26, 26, 26);


const Color lightGrey = Color(0xFFB8B8B8);
const Color darkGrey = Color(0xFF565657);
const Color extraLightGrey = Color(0xFFEEEEEE);
const Color mediumLightGrey = Color(0xFFDDDBDB);
const Color grey = Colors.grey;
const Color rippleColor = Color.fromARGB(255, 235, 235, 235);
const Color white = Colors.white;
const Color faintWhite = Color.fromARGB(255, 247, 247, 247);

const Color blackColor = Colors.black;
const Color lightGreen = Color(0xFFDAF6E7);

const Color blueColor = Color(0xFF217AEE);




//Buttom Background



extension ColorConversion on Color {
  MaterialColor toMaterialColor() {
    final List strengths = <double>[.05];
    final Map<int, Color> swatch = {};
    final r = red, g = green, b = blue;

    for (var i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }

    for (final strength in strengths) {
      final ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }

    return MaterialColor(value, swatch);
  }
}
