import 'package:flutter/material.dart';
import 'package:iti_coruses/constants/color_manager.dart';
import 'package:iti_coruses/constants/icon_broken.dart';
import 'package:iti_coruses/services/extension.dart';

import '../widgets/chat_commpnent.dart';
import 'chatdetails_screen.dart';

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
    tabController = TabController(length: 2, vsync: this, initialIndex: 0 );
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
                child: Container(
                  width: 175,
                  padding:const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    color: tabController?.index == 0
                        ? ColorManager.mustardYellow
                        : ColorManager.containerField,
                  ),
                  child: Text(
                    "Chat",
                    textAlign: TextAlign.center,

                    style: TextStyle(
                        color: tabController?.index == 0
                            ? Colors.black
                            : Colors.white,
                        fontSize: 15),
                  ),
                ),
              ),
              Tab(
                height: 100,
                child: Container(
                  width: 175,
                  padding:const EdgeInsets.symmetric( vertical: 15),
                  color: tabController?.index == 1
                      ? ColorManager.mustardYellow
                      : ColorManager.containerField,
                  child: Text(
                    "Groups",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: tabController?.index == 1
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                ),
              )
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
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => ListTile(
                            onTap: () {
                              context.navigator.push(MaterialPageRoute(
                                  builder: (context) => const ChatDetailsScreen(
                                        assetName: "assets/images/img_7.png",
                                        subTitleName: "Online",
                                        titleName: "Abdalluh Essam",
                                      )));
                            },
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 10),
                            iconColor: Colors.black,
                            leading: const CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  AssetImage("assets/images/img_7.png"),
                            ),
                            title: const Text("Olivia Anna",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                            subtitle: Text(
                              "Hi, please check the last task, that I....",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                      color: const Color.fromRGBO(
                                          184, 184, 184, 1)),
                            ),
                            dense: true,
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "31 min",
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
                          ),
                      itemCount: 5),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: MaterialButton(
                      color: ColorManager.mustardYellow,
                      minWidth: 175,
                      height: 57,
                      onPressed: () {},
                      child: Text(
                        "Start chat",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontFamily: "Inter",
                            ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  buildChatComponent(20,onTap: true),
                ],
              ),
            )
          ]),
    );
  }
}
