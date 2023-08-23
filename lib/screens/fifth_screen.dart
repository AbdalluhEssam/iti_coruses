
import 'package:flutter/material.dart';
import 'package:iti_coruses/services/extension.dart';

import '../constants/route_names.dart';
import '../widgets/default_app_bar.dart';

//.....Generics
//....mixins

//...................................................isolate


// AllStates
// enabled border
// disabled
// focus enabled/disabled
// all methods of navigation
class FifthScreen extends StatelessWidget {
  const FifthScreen({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(titleText: title),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: context.textTheme.headlineMedium,
          ),
          TextButton(
              // onPressed:onTap,
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
                
              },
              child: const Text("< back ")),
              TextButton(
              // onPressed:onTap,
              onPressed: () {
                context.navigator.pushNamedAndRemoveUntil(RouteNames.loginPageRouteName, (route) => false);
                
              },
              child: const Text("< back Login"))
        ],
      )),
    );
  }
}
