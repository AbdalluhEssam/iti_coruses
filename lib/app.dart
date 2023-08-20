import 'package:flutter/services.dart';
import 'package:iti_coruses/screens/onborading.dart';

import 'screens/home_screen.dart';
import 'package:flutter/material.dart';

// MaterialApp() 5 +

class ObourApp extends StatelessWidget {
  const ObourApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  MaterialApp(
      title: "Obour + Fuure",
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.white
          ),
        )
      ),
    );
  }
}
