import 'package:flutter/material.dart';
import 'package:iti_coruses/services/extension.dart';

import '../constants/route_names.dart';
import '../widgets/default_app_bar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
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
                context.navigator.pushNamed(RouteNames.formPageRouteName);
              },
              child: const Text("To Form")),
          TextButton(
              // onPressed:onTap,
              onPressed: context.navigator.canPop() == false
                  ? null
                  : () {
                      context.navigator.pop;
                    },
              child: const Text("To Hell"))
        ],
      )),
    );
  }
}
