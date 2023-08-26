import 'package:flutter/material.dart';
import 'package:iti_coruses/constants/color_manager.dart';
import 'package:iti_coruses/services/extension.dart';

import '../constants/route_names.dart';
import '../widgets/custom_button_widget.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
        child: buildMaterialButton(context, () {
          context.navigator.pushNamed(RouteNames.signInScreen);
        }, "Let’s Start"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                "assets/images/img.png",
                width: size.width * 0.2,
                height: size.width * 0.2,
              ),
            ),
            Container(
                width: double.infinity,
                height: size.width * 0.8,
                clipBehavior: Clip.none,
                margin: const EdgeInsets.symmetric(vertical: 20),
                decoration: const BoxDecoration(color: Colors.white),
                child: Image.asset(
                  "assets/images/img_1.png",
                  height: size.width * 0.7,
                  // width: size.width *0.2,
                  alignment: Alignment.center,
                )),
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Manage\nyour\nTask with",
                    style: TextStyle(
                        letterSpacing: 2,
                        fontSize: 50,
                        height: 1,
                        fontFamily: "PilatExtended",
                        color: Colors.white),
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    "DayTask",
                    style: TextStyle(
                        fontSize: 50,
                        fontFamily: "PilatExtended",
                        height: 1,
                        letterSpacing: 2,
                        color: ColorManager.mustardYellow),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
