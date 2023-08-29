import 'package:flutter/material.dart';
import 'package:iti_coruses/constants/color_manager.dart';
import 'package:iti_coruses/constants/icon_broken.dart';
import 'package:iti_coruses/widgets/chat_commpnent.dart';
import 'package:iti_coruses/widgets/default_app_bar.dart';

class NewMassageScreen extends StatelessWidget {
  const NewMassageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        titleText: "New Message",
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: IconButton(
                onPressed: () {}, icon: const Icon(IconBroken.Search)),
          )
        ],
        leading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            ListTile(
              onTap: () {},
              contentPadding: const EdgeInsets.symmetric(vertical: 10),
              iconColor: Colors.black,
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: ColorManager.mustardYellow,
                child: const Icon(
                  IconBroken.User,
                  color: Colors.black,
                  size: 35,
                ),
              ),
              title:  Text("Create a group",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 18)),
            ),
            buildChatNewMassageComponent(itemCount: 50,onTap: () {},),
          ],
        ),
      ),
    );
  }
}
