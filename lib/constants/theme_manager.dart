import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_manager.dart';

class ThemeManager {
  ThemeManager._();
  static ThemeManager shared = ThemeManager._();

  getAppTheme(BuildContext context) => ThemeData(
    inputDecorationTheme: const InputDecorationTheme(),
      textTheme: const TextTheme(
      //     headlineLarge: TextStyle(
      //   color: Colors.black,
      //   fontSize: 26,
      //   fontFamily: 'Inter',
      //   fontWeight: FontWeight.w600,
      //   height: 0.59,
      // )
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        systemOverlayStyle:SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: ColorManager.textField
        ) ,
          backgroundColor: ColorManager.textField, centerTitle: true));
}
