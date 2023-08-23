
import 'package:flutter/material.dart';
import 'package:iti_coruses/services/extension.dart';

import '../widgets/default_app_bar.dart';
import 'fourth_screen.dart';

//.....Generics
//....mixins

//...................................................isolate

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({
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
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) {
                    return const FourthScreen(
                      title: "Fourth Page",
                    );
                  },
                ));
              },
              child: const Text("next >"))
        ],
      )),
    );
  }
}
