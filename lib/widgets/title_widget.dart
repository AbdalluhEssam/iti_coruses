import 'package:flutter/material.dart';

Widget buildTitle(context , title) =>  Padding(
  padding: const EdgeInsets.symmetric(vertical: 5),
  child:   Text(
    title,
    style:
    Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 20),
  ),
);