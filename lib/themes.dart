import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.blue,
    elevation: 4,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  cardTheme: CardTheme(
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
    bodyMedium: TextStyle(fontSize: 16, color: Colors.black87),
  ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blueAccent),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.grey[900],
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[900],
    elevation: 4,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  cardTheme: CardTheme(
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
    bodyMedium: TextStyle(fontSize: 16, color: Colors.white70),
  ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.tealAccent),
);

final ThemeData blueTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.indigo,
  scaffoldBackgroundColor: Colors.indigo[50],
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.indigo,
    elevation: 4,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  cardTheme: CardTheme(
    elevation: 6,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.indigo[900]),
    bodyMedium: TextStyle(fontSize: 16, color: Colors.indigo[800]),
  ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.indigoAccent),
);

final ThemeData elegantTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.deepPurple,
  scaffoldBackgroundColor: Colors.grey[100],
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.deepPurple,
    elevation: 4,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  cardTheme: CardTheme(
    elevation: 8,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepPurple[900]),
    bodyMedium: TextStyle(fontSize: 18, color: Colors.grey[800]),
  ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.deepPurpleAccent),
);
