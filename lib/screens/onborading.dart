import 'package:flutter/material.dart';
import 'package:iti_coruses/constants/color_manager.dart';
import 'package:iti_coruses/services/extension.dart';

import '../constants/route_names.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.textField,
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(
                  "assets/images/img.png",
                  width: 90,
                  height: 90,
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Image.asset(
                    "assets/images/img_1.png",
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Manage\nyour\nTask with",
                    style: TextStyle(
                        letterSpacing: 2,
                        fontSize: 55,
                        height: 1,
                        fontFamily: "PilatExtended",
                        color: Colors.white),
                  ),
                  Text(
                    "DayTask",
                    style: TextStyle(
                        fontSize: 55,
                        fontFamily: "PilatExtended",
                        height: 1,
                        letterSpacing: 2,
                        color: ColorManager.mustardYellow),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    onPressed: () {
                      context.navigator.pushNamed(RouteNames.signInScreen);
                    },
                    color: const Color(0xfffed36a),
                    height: 65,
                    minWidth: 400,
                    child: const Text("Let’s Start",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
