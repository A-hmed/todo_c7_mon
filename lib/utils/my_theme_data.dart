import 'package:flutter/material.dart';

class MyThemeData {
  static Color primirayColor = Color(0xff5D9CEC);
  static Color accentColor = Color(0xffDFECDB);
  static Color lightGreen = Color(0xff61E757);
  static Color greyColor = Color(0xffC8C9CB);
  static Color redColor = Color(0xffEC4B4B);

  static Color primirayColorDark = Color(0xff141A2E);
  static Color accentColorDark = Color(0xffFACC1D);

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: accentColor,
    primaryColor: primirayColor,
    accentColor: accentColor,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: primirayColor,
      titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: primirayColor,
      unselectedItemColor: greyColor,
      showUnselectedLabels: false,
      showSelectedLabels: false
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      shape: CircularNotchedRectangle(),
      elevation: 0
    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: primirayColor),
      titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black54),
      bodySmall: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold ),

    )
  );

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: primirayColorDark,
      accentColor: accentColorDark,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: accentColorDark
      ),
      textTheme: TextTheme(
          titleMedium: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: Colors.white),
          titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
         bodySmall: TextStyle(color: accentColorDark, fontSize: 18, ),

      )
  );

}