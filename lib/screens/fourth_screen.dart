
import 'package:flutter/material.dart';
import 'package:iti_coruses/services/extension.dart';

import '../constants/route_names.dart';
import '../widgets/default_app_bar.dart';

//.....Generics
//....mixins

//...................................................isolate

class FourthScreen extends StatelessWidget {
  const FourthScreen({
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
                context.navigator.pushNamed(RouteNames.fifthPageRouteName);
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) {
                //       return const FifthScreen(
                //         title: "Fifth Page",
                //       );
                //     },
                //     fullscreenDialog: false));
              },
              child: const Text("next >"))
        ],
      )),
    );
  }
}
