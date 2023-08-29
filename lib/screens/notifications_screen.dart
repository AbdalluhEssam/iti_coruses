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
        leading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25,right: 10),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            buildTitleWithPadding(context, "New",5),
            buildNotificationComponent(4,
                color: ColorManager.mustardYellow,
                time: "31 min",
                text: "Mobile App Design Project",
                title: "left a comment in task"),
            const SizedBox(
              height: 15,
            ),
            buildTitleWithPadding(context, "Earlier",5),
            buildNotificationComponent(3,
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
