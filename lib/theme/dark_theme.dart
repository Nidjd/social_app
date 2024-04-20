import "package:flutter/material.dart";

ThemeData darkTheme = ThemeData(
  textTheme: const TextTheme(
    labelLarge: TextStyle(
      color: Colors.white,
    ),
  ),
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
  ),
  colorScheme: ColorScheme.dark(
    background: Colors.black,
    primary: Colors.grey[900]!,
    secondary: Colors.grey[800]!,
  ),
);
