
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import '../constants/color_manager.dart';
import '../constants/icon_broken.dart';

Widget buildCreateNewTask(int length) => Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    ...List.generate(length, (index) => Container(
      width: 155,
      height: 41,
      padding: const EdgeInsets.only(left: 10),
      decoration:
      BoxDecoration(color: ColorManager.textFieldBackGround),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const CircleAvatar(
            radius: 10,
            backgroundImage: AssetImage("assets/images/img_7.png"),
          ),
          Text(Faker().person.firstName()),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                IconBroken.Close_Square,
                color: Colors.white,
              ))
        ],
      ),
    )),
    Container(
        width: 41,
        height: 41,
        decoration:
        BoxDecoration(color: ColorManager.mustardYellow),
        child: IconButton(
            padding:const EdgeInsetsDirectional.only(end: 1, top: 1),
            onPressed: () {},
            icon: const Icon(
              IconBroken.Plus,
              size: 30,
              color: Colors.black,
            )))
  ],
);