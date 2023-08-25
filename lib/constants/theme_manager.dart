import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_manager.dart';

class ThemeManager {
  ThemeManager._();

  static ThemeManager shared = ThemeManager._();

  getAppTheme(BuildContext context) => ThemeData(
      inputDecorationTheme: const InputDecorationTheme(),
      // iconTheme: const IconThemeData(color: Colors.black),
      textTheme:  TextTheme(
        bodyLarge:const TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontFamily: 'Inter',
          fontWeight: FontWeight.bold,
        ),
        bodyMedium:const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        labelLarge: const TextStyle(
          color: Colors.black,
          fontSize: 21,
          overflow: TextOverflow.visible,
          fontFamily: 'PilatExtended',
          fontWeight: FontWeight.bold,
        ),
        bodySmall:const TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontFamily: 'PilatExtended',
          fontWeight: FontWeight.bold,
        ),
        headlineLarge: TextStyle(
          color: ColorManager.mustardYellow,
          fontSize: 16,
          fontFamily: 'Inter',
          fontWeight: FontWeight.bold,
        ),
        labelMedium: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontFamily: 'Inter',
          fontWeight: FontWeight.bold,
        ),
        labelSmall: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontFamily: 'Cairo',
        ),
      ),
      appBarTheme: AppBarTheme(
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarBrightness: Brightness.light,
              statusBarColor: ColorManager.textField),
          backgroundColor: ColorManager.textField,
          centerTitle: true));
}
