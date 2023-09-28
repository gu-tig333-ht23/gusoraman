import 'package:flutter/material.dart';

class UiTheme {
  static ThemeData myTheme() {
    return ThemeData(
      useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          primary: Colors.white,
          secondary: Colors.black,
          seedColor: Colors.black,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: Colors.white,  
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 196, 196, 196),
          foregroundColor: Colors.black,
        ),           
      );
    }
  }