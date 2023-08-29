import 'package:flutter/material.dart';

Widget buildStackImage({double? height,required int length ,bool? left})=>  SizedBox(
  height: height ?? 30,
  child: Stack(
    alignment: AlignmentDirectional.center,
    children: [
      ...List.generate(
        length,
            (index) {
          double a = 0;
          List<double> end =
          List.generate(
              index + 1,
                  (index) {
                a += 13;
                return a;
              });
          end.insert(0, 0);
          return PositionedDirectional(
              start:left == true? end[index] : null,
              end:left == false? end[index] : null,
              child:
              const CircleAvatar(
                radius: 10,
                backgroundImage:
                AssetImage(
                  "assets/images/img_7.png",
                ),
              ));
        },
      ),
    ],
  ),
);