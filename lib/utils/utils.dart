import 'dart:ui';

class AppConstants {
  static const appName = "Watch Shop";
}

class AppFonts {
  static const primaryFont = "Poppins";
}

class AppFunctions {
   static Color formatColor(String color) {
    var newColor = color.substring(1).toUpperCase();
    var preffix = "0xFF";
    var finalColor = int.parse(preffix + newColor);
    return Color(finalColor);
  }
}

class AppImages {
  static const logo = "assets/images/logo.png";
  static const watch10 = "assets/images/watch10.png";
  static const watch11 = "assets/images/watch11.png";
  static const watch20 = "assets/images/watch20.png";
  static const watch21 = "assets/images/watch21.png";
  static const watch30 = "assets/images/watch30.png";
  static const watch31 = "assets/images/watch31.png";
  static const watch40 = "assets/images/watch40.png";
  static const watch41 = "assets/images/watch41.png";
}
