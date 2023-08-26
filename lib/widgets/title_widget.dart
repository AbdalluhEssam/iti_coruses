import 'package:flutter/material.dart';

Widget buildTitle(context, title) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 20),
      ),
    );

Widget buildTitleWithPadding(context, title,[double? vertical]) => Padding(
      padding:  EdgeInsets.symmetric(vertical:vertical?? 20),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 20),
      ),
    );

Widget buildTitleWithPaddingBodyLarge(context, title,[double? vertical]) => Padding(
      padding:  EdgeInsets.symmetric(vertical:vertical?? 20),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );

Widget buildTitleWithRow(context, {title,subTitle}) =>Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    buildTitleWithPaddingBodyLarge(context, title ),
    InkWell(
      onTap: () {

      },
      child:   Text(
        subTitle,
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    )

  ],
);
