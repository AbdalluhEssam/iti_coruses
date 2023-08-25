import 'package:flutter/material.dart';
import 'package:iti_coruses/constants/color_manager.dart';
import 'package:iti_coruses/widgets/default_app_bar.dart';
import 'package:iti_coruses/widgets/title_widget.dart';

import '../widgets/chat_commpnent.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        titleText: "Notifications",
        leading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25,right: 10),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            buildTitle(context, "New"),
            buildChatComponent(4,
                color: ColorManager.mustardYellow,
                time: "31 min",
                text: "Mobile App Design Project",
                title: "left a comment in task"),
            const SizedBox(
              height: 20,
            ),
            buildTitle(context, "Earlier"),
            buildChatComponent(3,
                color: ColorManager.mustardYellow,
                time: "31 min",
                text: "Mobile App Design Project",
                title: "left a comment in task"),
          ],
        ),
      ),
    );
  }
}
