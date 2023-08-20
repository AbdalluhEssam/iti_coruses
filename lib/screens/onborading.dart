import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(38, 50, 56, 1),
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset(
                "assets/images/img.png",
                width: 80,
                height: 80,
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
              children: const [
                Text(
                  "Manage\nyour\nTask with",
                  style: TextStyle(

                      fontSize: 55,
                      height: 1.1,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Inter",
                      color: Color.fromRGBO(255, 255, 255, 1)),
                ),
                Text(
                  "DayTask",
                  style: TextStyle(
                      fontSize: 55,
                      fontFamily: "Inter",
                      height: 1.1,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(254, 211, 106, 1)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
