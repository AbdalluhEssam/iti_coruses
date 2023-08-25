import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:iti_coruses/constants/color_manager.dart';
import 'package:iti_coruses/services/extension.dart';

import '../screens/chatdetails_screen.dart';

Widget buildChatComponent(int itemCount,{Color? color, String? text, String? time, String? title ,bool? onTap}) =>
    ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => ListTile(
              onTap: () {
                if(onTap == true) {
                  context.navigator.push(MaterialPageRoute(
                    builder: (context) => const ChatDetailsScreen(
                          assetName: "assets/images/abd.jpeg",
                          subTitleName: "Online",
                          titleName: "Android Developer",
                        )));
                }
              },
              contentPadding:const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              iconColor: Colors.black,
              leading: const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("assets/images/abd.jpeg"),
              ),
              title: RichText(
                  text: TextSpan(
                      text: Faker().person.name(),
                      style: const TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.normal),
                      children: [
                    if (title != null)
                      TextSpan(
                          text: " $title",
                          style:TextStyle(color: ColorManager.textColor, fontSize: 12,fontWeight: FontWeight.normal)),
                  ])),
              subtitle: Text(
                text ?? "Robert: Did you check the last task?",
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: color ?? const Color.fromRGBO(184, 184, 184, 1),fontWeight: FontWeight.normal),
              ),
              dense: true,
              trailing: Text(
                time ?? "15:35",
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
        itemCount: itemCount);
