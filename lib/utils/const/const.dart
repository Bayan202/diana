import 'package:flutter/material.dart';

class FlowerColors {
  static const Color primaryColor = Color.fromARGB(255, 255, 44, 2);
  static const Color secondaryColor = Color.fromARGB(255, 255, 255, 255);
  static const Color accentColor = Color.fromARGB(255, 242, 114, 193);
  static const Color appColor = Color.fromARGB(255, 183, 178, 181);
  static const Color beColors = Color.fromARGB(255, 95, 93, 94);
  static const Color afterColors = Color.fromARGB(255, 102, 50, 248);
}

class AppGradients {
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color.fromARGB(255, 247, 115, 115), Color.fromARGB(255, 245, 27, 27)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 1.0],
  );
}