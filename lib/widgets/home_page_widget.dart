import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:iti_coruses/services/extension.dart';
import 'package:iti_coruses/widgets/stack_image_widget.dart';

import '../constants/color_manager.dart';
import '../constants/route_names.dart';

Widget buildNameAndImage(
  context, {
  String? titleName,
  required String assets,
  required Function()? onTap,
}) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome Back!",
              style: TextStyle(fontSize: 15, color: ColorManager.mustardYellow),
            ),
            Text(
              titleName ?? "Fazil Laghari",
              style: const TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontFamily: "PilatExtended"),
            ),
          ],
        ),
        InkWell(
          onTap: onTap,
          child: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(assets),
          ),
        )
      ],
    );

Widget buildTasksBox() => SizedBox(
      height: 175,
      child: ListView.separated(
        clipBehavior: Clip.none,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            context.navigator.pushNamed(RouteNames.taskDetailsScreen);
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            width: 185,
            height: 175,
            decoration: BoxDecoration(
                color: index == 0
                    ? ColorManager.mustardYellow
                    : ColorManager.textFieldBackGround),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "Real Estate Website Design",
                    style: index == 0
                        ? Theme.of(context).textTheme.labelLarge
                        : Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(color: Colors.white),
                  ),
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Team members",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Inter",
                            color: index == 0 ? Colors.black : Colors.white),
                      ),
                      Flexible(
                        child: buildStackImage(length: 5, left: false),
                      ),
                    ],
                  ),
                ),
                Flexible(
                    child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Completed",
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 12,
                                color:
                                    index == 0 ? Colors.black : Colors.white),
                          ),
                          Text(
                            "100%",
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 12,
                                color:
                                    index == 0 ? Colors.black : Colors.white),
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      child: LinearProgressIndicator(
                        color: ColorManager.linearColor,
                        value: index == 0 ? 100 : 0,
                        backgroundColor: Colors.white,
                      ),
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
      ),
    );

Widget buildOngoingBox({required int itemCount}) => ListView.separated(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemBuilder: (context, index) {
      double random = Random().nextDouble();
      DateTime date;
      DateTime dateNow = DateTime.now().add(Duration(days: index));
      date = DateTime(dateNow.year, dateNow.month, dateNow.day);
      return Container(
        width: 390,
        height: 130,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(color: ColorManager.textFieldBackGround),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Mobile App Wireframe",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Team members",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      buildStackImage(length: 3, left: true),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Due on : ${DateFormat("d MMMM").format(date)}",
                        style: Theme.of(context).textTheme.labelMedium,
                      )
                    ],
                  ),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 59,
                      height: 59,
                      child: CircularProgressIndicator(
                        value: random,
                        color: ColorManager.mustardYellow,
                        backgroundColor: ColorManager.textField,
                        strokeWidth: 3,
                      ),
                    ),
                    Text(
                      "${(random * 100).toInt()}%",
                      style: Theme.of(context).textTheme.labelMedium,
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      );
    },
    separatorBuilder: (context, index) => const SizedBox(
          height: 20,
        ),
    itemCount: itemCount);
