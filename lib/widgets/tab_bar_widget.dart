import 'package:flutter/material.dart';

import '../constants/color_manager.dart';

Widget buildTabBar({TabController? tabController , text,index}) =>  Container(
  width: 175,
  padding: const EdgeInsets.symmetric(vertical: 15),
  color: tabController?.index == index
      ? ColorManager.mustardYellow
      : ColorManager.containerField,
  child: Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 15,
      color: tabController?.index == index
          ? Colors.black
          : Colors.white,
    ),
  ),
);