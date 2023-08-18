import 'screens/home_screen.dart';
import 'package:flutter/material.dart';

// MaterialApp() 5 +

class ObourApp extends StatelessWidget {
  const ObourApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const MaterialApp(
      title: "Obour + Fuure",
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      home: HomeScreen(),
      
    );
  }
}
