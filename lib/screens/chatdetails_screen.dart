import 'package:flutter/material.dart';
import 'package:iti_coruses/constants/color_manager.dart';
import 'package:iti_coruses/constants/icon_broken.dart';
import 'package:iti_coruses/services/extension.dart';

import '../widgets/chat_massega_widget.dart';

class ChatDetailsScreen extends StatelessWidget {
  const ChatDetailsScreen(
      {super.key,
      required this.assetName,
      required this.titleName,
      required this.subTitleName});

  final String assetName;
  final String titleName;
  final String subTitleName;

  @override
  Widget build(BuildContext context) {
    TextEditingController messageController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 5,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: IconButton(
              onPressed: () {
                context.navigator.pop();
              },
              icon: const Icon(IconBroken.Arrow___Left)),
        ),
        title: Row(
          children: [
            Flexible(
              child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(assetName),
              ),
            ),
            const SizedBox(
              width: 17,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titleName,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontSize: 15),
                  ),
                  Text(
                    subTitleName,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontSize: 14, color: ColorManager.textColor),
                  ),
                ],
              ),
            )
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(IconBroken.Video)),
          IconButton(onPressed: () {}, icon: const Icon(IconBroken.Calling)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
                child:
                    ListView(physics: const BouncingScrollPhysics(), children: [
              const BuildMessage(text: "Hi, please check the new task."),
              buildMyMessage(context, text: "Hi, please check the new task."),
              const BuildMessage(text: "Got it. Thanks."),
              const BuildMessage(text:"Hi, please check the last task, that I have completed."),
              const BuildMessage(text: "assets/images/img_8.png"),
              buildMyMessage(context, text: "Got it. Will check it soon."),
            ])),
            buildBottomNavBar(messageController),
          ],
        ),
      ),
    );
  }
}
