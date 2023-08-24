import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iti_coruses/screens/fifth_screen.dart';
import 'package:iti_coruses/screens/form_screen.dart';
import 'package:iti_coruses/screens/fourth_screen.dart';
import 'package:iti_coruses/screens/home_screen.dart';
import 'package:iti_coruses/screens/login_screen.dart';
import 'package:iti_coruses/screens/onborading.dart';
import 'package:iti_coruses/screens/singin_screen.dart';
import 'package:iti_coruses/screens/singup_screen.dart';
import 'package:iti_coruses/screens/third_screen.dart';
import 'constants/route_names.dart';
import 'constants/theme_manager.dart';

void main() {
  runApp(const ProviderScope(child: DayTaskApp()));
}


class DayTaskApp extends StatelessWidget {
  const DayTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Day Task",
      debugShowCheckedModeBanner: false,
      // home: const FormScreen(),
      theme: ThemeManager.shared.getAppTheme(context),
      // Navigator.of(context).push(MaterialPageRoute(
      //             builder: (context) {
      //               return const FourthScreen(
      //                 title: "Fourth Page",
      //               );
      //             },
      //           ));
      initialRoute: RouteNames.onBoarding,
      routes: {
        RouteNames.onBoarding: (context) => const OnBoarding(),
        RouteNames.formPageRouteName: (context) => const FormScreen(),
        RouteNames.loginPageRouteName: (context) =>  const LoginScreen(title: "Login Page"),
        RouteNames.testScreen: (context) =>const TestScreen(title: "TTest Screen"),
        RouteNames.fourthPageRouteName: (context) =>const FourthScreen(title: "Fourth Page"),
        RouteNames.fifthPageRouteName: (context) =>const FifthScreen(title: "Fifth Page"),
        RouteNames.home: (context) =>const HomeScreen(),
        RouteNames.signInScreen: (context) =>const SignInScreen(title: "SignIN"),
        RouteNames.signUpScreen: (context) =>const SignUpScreen(title: "Sign UP"),
      },
    );
  }
}
// 1- void main()
// 2- call runApp(...)
//3 create instance of my app 

//3 return MaterialApp inside build() Method
//4- add your first page inside home:

