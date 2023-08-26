import 'package:flutter/material.dart';
import 'package:iti_coruses/constants/icon_broken.dart';
import 'package:iti_coruses/services/extension.dart';
import 'package:iti_coruses/widgets/tab_bar_widget.dart';

import '../widgets/chat_commpnent.dart';
import '../widgets/custom_button_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    tabController?.addListener(() {
      setState(() {
        if (tabController?.indexIsChanging == true) {
          setState(() {});
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: IconButton(
                onPressed: () {
                  context.navigator.pop();
                },
                icon: const Icon(IconBroken.Arrow___Left))),
        title: const Text("Messages"),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: IconButton(
                onPressed: () {}, icon: const Icon(IconBroken.Edit_Square)),
          )
        ],
        bottom: TabBar(
            controller: tabController,
            physics: const NeverScrollableScrollPhysics(),
            indicatorColor: Colors.transparent,
            isScrollable: true,
            onTap: (value) {
              if (tabController?.index == value) {
                setState(() {});
              }
            },
            tabs: [
              Tab(
                  height: 100,
                  child: buildTabBar(
                      text: "Chat", tabController: tabController, index: 0)),
              Tab(
                  height: 100,
                  child: buildTabBar(
                      text: "Groups", tabController: tabController, index: 1))
            ]),
      ),
      body: TabBarView(
          controller: tabController,
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  buildChatComponent(20, onTap: true),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: buildMaterialButton(
                        context, () {}, "Start chat", 57, 175),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  buildChatGroupComponent(20, onTap: true),
                ],
              ),
            )
          ]),
    );
  }
}
