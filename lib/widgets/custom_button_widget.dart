import 'package:flutter/material.dart';
import 'package:iti_coruses/constants/color_manager.dart';

Widget buildMaterialButton(context, void Function()? onPressed, String text , [double? fontSize ,double? height,double? width]) =>
    SizedBox(
      width:width?? double.infinity,
      child: MaterialButton(
        onPressed: onPressed,
        color: ColorManager.mustardYellow,
        height:height ?? 60,
        child: Text(text,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.black , fontSize: fontSize ?? null)),
      ),
    );
