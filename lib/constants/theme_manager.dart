import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_manager.dart';

class ThemeManager {
  ThemeManager._();

  static ThemeManager shared = ThemeManager._();

  getAppTheme(BuildContext context) => ThemeData.light().copyWith(
      scaffoldBackgroundColor: Colors.white,
      bottomNavigationBarTheme:
          const BottomNavigationBarThemeData(backgroundColor: Colors.white),
      primaryColor: ColorManager.mustardYellow,
      backgroundColor: ColorManager.backFormColor,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontFamily: 'PilatExtended',
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontFamily: 'Inter',
          fontWeight: FontWeight.bold,
        ),
        labelLarge: TextStyle(
          color: Colors.black,
          fontSize: 20,
          overflow: TextOverflow.visible,
          fontFamily: 'PilatExtended',
          fontWeight: FontWeight.bold,
        ),
        headlineLarge: TextStyle(
          color: Colors.blue,
          fontSize: 16,
          fontFamily: 'Inter',
          fontWeight: FontWeight.bold,
        ),
        labelMedium: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontFamily: 'Inter',
          fontWeight: FontWeight.bold,
        ),
        labelSmall: TextStyle(
          color: Colors.black,
          fontSize: 10,
          fontFamily: 'Cairo',
        ),
      ),
      appBarTheme: const AppBarTheme(
          elevation: 0,
          foregroundColor: Colors.black,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: Colors.white),
          backgroundColor: Colors.white,
          centerTitle: true));

  getAppThemeDark(BuildContext context) => ThemeData.dark().copyWith(
      scaffoldBackgroundColor: ColorManager.textField,
      primaryColor: ColorManager.mustardYellow,
      backgroundColor: ColorManager.textField,
      bottomNavigationBarTheme:
          BottomNavigationBarThemeData(backgroundColor: ColorManager.textField),
      textTheme: TextTheme(
        bodyLarge: const TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontFamily: 'PilatExtended',
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: const TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontFamily: 'Inter',
          fontWeight: FontWeight.bold,
        ),
        labelLarge: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          overflow: TextOverflow.visible,
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
