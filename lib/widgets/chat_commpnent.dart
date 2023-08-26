import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:iti_coruses/constants/color_manager.dart';
import 'package:iti_coruses/res.dart';
import 'package:iti_coruses/services/extension.dart';

import '../screens/chatdetails_screen.dart';

Widget buildChatGroupComponent(int itemCount,
        {Color? color,
        String? text,
        String? time,
        String? title,
        bool? onTap}) =>
    ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => ListTile(
              onTap: () {
                if (onTap == true) {
                  context.navigator.push(MaterialPageRoute(
                      builder: (context) => const ChatDetailsScreen(
                            assetName: Res.abdallah,
                            subTitleName: "Online",
                            titleName: "Android Developer",
                          )));
                }
              },
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              iconColor: Colors.black,
              leading: const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(Res.abdallah),
              ),
              title: RichText(
                  text: TextSpan(
                      text: Faker().person.name(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                      children: [
                    if (title != null)
                      TextSpan(
                          text: " $title",
                          style: TextStyle(
                              color: ColorManager.textColor,
                              fontSize: 12,
                              fontWeight: FontWeight.normal)),
                  ])),
              subtitle: Text(
                text ?? "Robert: Did you check the last task?",
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: color ?? const Color.fromRGBO(184, 184, 184, 1),
                    fontWeight: FontWeight.normal),
              ),
              dense: true,
              trailing: Text(
                time ?? "15:35",
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
        itemCount: itemCount);

Widget buildChatComponent(int itemCount,
        {Color? color,
        String? text,
        String? time,
        String? title,
        bool? onTap}) =>
    ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          String name = Faker().person.name();
          return ListTile(
            onTap: () {
              context.navigator.push(MaterialPageRoute(
                  builder: (context) => ChatDetailsScreen(
                        assetName: Res.circleAvatar,
                        subTitleName: "Online",
                        titleName: name,
                      )));
            },
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            iconColor: Colors.black,
            leading: const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(Res.circleAvatar),
            ),
            title: Text(name,
                style: const TextStyle(color: Colors.white, fontSize: 18)),
            subtitle: Text(
              "Hi, please check the last task, that I....",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: const Color.fromRGBO(184, 184, 184, 1)),
            ),
            dense: true,
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${DateFormat.m().format(DateTime.now())} min",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                if (index < 2)
                  const SizedBox(
                    height: 5,
                  ),
                if (index < 2)
                  CircleAvatar(
                    backgroundColor: ColorManager.mustardYellow,
                    radius: 3.5,
                  )
              ],
            ),
          );
        },
        itemCount: 5);

Widget buildChatNewMassageComponent(
        {required int itemCount,
        Color? color,
        String? text,
        String? time,
        String? title,
        Function()? onTap}) =>
    ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          String name = Faker().person.name();
          return ListTile(
            onTap: onTap,
            contentPadding: const EdgeInsets.symmetric(vertical: 15),
            iconColor: Colors.black,
            leading: const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(Res.circleAvatar),
            ),
            title: Text(name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
                maxLines: 1),
            trailing: Text(
              name.characters.first,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(fontSize: 16),
            ),
          );
        },
        itemCount: itemCount);

Widget buildNotificationComponent(int itemCount,
        {Color? color,
        String? text,
        String? time,
        String? title,
        bool? onTap}) =>
    ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          String name = Faker().person.firstName();
          return ListTile(
            onTap: () {},
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            iconColor: Colors.black,
            leading: const CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(Res.circleAvatar),
            ),
            title: RichText(
                text: TextSpan(
                  spellOut: true,
                    text: name,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    children: [
                  TextSpan(
                    text: " left a comment in task",
                    style:  TextStyle(color: ColorManager.textColor, fontSize: 14),
                  )
                ])),
            subtitle: Text(
              "Mobile App Design Project",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: ColorManager.mustardYellow,fontWeight: FontWeight.normal),
            ),
            dense: true,
            trailing: Text(
              "${DateFormat.m().format(DateTime.now())} min",
              style: Theme.of(context).textTheme.labelSmall,
            ),
          );
        },
        itemCount: itemCount);
