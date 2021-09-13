import 'package:flutter/material.dart';

class LightTheme {
  static ThemeData get theme {
    return ThemeData(
      scaffoldBackgroundColor: Colors.grey[200],
      brightness: Brightness.light,
      primaryColor: Colors.grey[200],
      primarySwatch: Colors.amber,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0.0),
          backgroundColor: MaterialStateProperty.all(Colors.amber[600]),
          foregroundColor: MaterialStateProperty.all(Colors.black87),
        ),
      ),
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0,
        titleSpacing: 16,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 30,
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.black54,
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.fromLTRB(20, 12, 12, 12),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        hoverColor: Colors.transparent,
      ),
      iconTheme: IconThemeData(
        color: Colors.amber[600],
        size: 24,
      ),
      cardTheme: CardTheme(
        color: Colors.white,
        elevation: 0,
        //shadowColor: Colors.grey[50],
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      dividerTheme: DividerThemeData(color: Colors.black38, thickness: 0.2),
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 60),
        headline2: TextStyle(fontSize: 48),
        headline3: TextStyle(fontSize: 34),
        headline4: TextStyle(fontSize: 24),
        headline5: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        headline6: TextStyle(fontSize: 16),
      ),
    );
  }
}
