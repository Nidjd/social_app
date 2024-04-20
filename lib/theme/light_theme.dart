import "package:flutter/material.dart";

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: const TextTheme(
      labelLarge: TextStyle(color: Colors.black,),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.grey,
      elevation: 0.0,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    colorScheme: ColorScheme.light(
      background: Colors.grey[300]!,
      primary: Colors.grey[200]!,
      secondary: Colors.grey[300]!,
      
    ));
