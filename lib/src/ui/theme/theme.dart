
import 'package:flutter/material.dart';

class AppTheme {
    static final _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(color: Colors.transparent) 
  );
  static final theme = ThemeData(
    useMaterial3: true,
    inputDecorationTheme:  InputDecorationTheme(
      filled: true,
      labelStyle: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w700),
      floatingLabelStyle: const  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
      border: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      errorBorder: _defaultInputBorder.copyWith(
        borderSide: const BorderSide(color: Colors.red)
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 83, 82, 82),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ) ,
      ),
    ),

  );
}

