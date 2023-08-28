import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iti_coruses/screens/chat_screen.dart';
import 'package:iti_coruses/screens/create_new_task_screen.dart';
import 'package:iti_coruses/screens/home_screen.dart';
import 'package:iti_coruses/screens/newmassage_screen.dart';
import 'package:iti_coruses/screens/onborading.dart';
import 'package:iti_coruses/screens/singin_screen.dart';
import 'package:iti_coruses/screens/singup_screen.dart';
import 'package:iti_coruses/screens/task_details.dart';
import 'package:iti_coruses/screens/third_screen.dart';

import 'constants/route_names.dart';
import 'constants/theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'SR')],
      path: 'assets/translations',
      // <-- change the path of the translation files
      fallbackLocale: const Locale('en', 'US'),
      child: const ProviderScope(child: DayTaskApp())));
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
        RouteNames.testScreen: (context) =>
            const TestScreen(title: "Test Screen"),
        RouteNames.home: (context) => const HomeScreen(),
        RouteNames.signInScreen: (context) =>
            const SignInScreen(title: "SignIN"),
        RouteNames.signUpScreen: (context) =>
            const SignUpScreen(title: "Sign UP"),
        RouteNames.taskDetailsScreen: (context) => const TaskDetailsScreen(),
        RouteNames.chatScreen: (context) => const ChatScreen(),
        RouteNames.newMassageScreen: (context) => const NewMassageScreen(),
        RouteNames.createNewTaskScreen: (context) =>
            const CreateNewTaskScreen(),
        // RouteNames.chatDetailsScreen: (context) => const ChatDetailsScreen(assetName: '',),
      },
    );
  }
}
// 1- void main()
// 2- call runApp(...)
//3 create instance of my app

//3 return MaterialApp inside build() Method
//4- add your first page inside home:
