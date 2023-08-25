import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iti_coruses/constants/color_manager.dart';
import 'package:iti_coruses/constants/icon_broken.dart';
import 'package:iti_coruses/services/extension.dart';
import 'package:iti_coruses/widgets/default_app_bar.dart';

final checkProvider = Provider<bool>((ref) {
  return true;
});
final checkStateProvider = StateNotifierProvider<CheckNotifier, bool>((ref) {
  return CheckNotifier();
});

class CheckNotifier extends StateNotifier<bool> {
  CheckNotifier() : super(false);
  bool checkState = false;

  bool check() {
    return checkState = !checkState;
  }
}

class ChatScreen extends ConsumerWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorManager.textField,
      appBar: MyAppBar(
        leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: IconButton(
                onPressed: () {
                  context.navigator.pop();
                },
                icon: const Icon(IconBroken.Arrow___Left))),
        titleText: "Messages",
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: IconButton(
                onPressed: () {}, icon: const Icon(IconBroken.Edit_Square)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 68, vertical: 15),
                  decoration: BoxDecoration(
                    color: ColorManager.mustardYellow,
                  ),
                  child: const Text(
                    "Chat",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 68, vertical: 15),
                  color: ColorManager.containerField,
                  child: const Text(
                    "Groups",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 10),
                      iconColor: Colors.black,
                      leading: const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/images/img_7.png"),
                      ),
                      title: const Text("Olivia Anna",
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      subtitle: Text(
                        "Hi, please check the last task, that I....",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(
                                color: const Color.fromRGBO(184, 184, 184, 1)),
                      ),
                      dense: true,
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "31 min",
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          if(index < 2)
                          const SizedBox(
                            height: 5,
                          ),
                          if(index < 2)
                          CircleAvatar(
                            backgroundColor: ColorManager.mustardYellow,
                            radius: 3.5,
                          )
                        ],
                      ),
                    ),
                itemCount: 5),
            const SizedBox(height: 20,),
            Container(
              alignment: Alignment.centerRight,
              child: MaterialButton(
                color: ColorManager.mustardYellow,
                minWidth: 175,
                height: 57,
                onPressed: () {},
                child: Text(
                  "Start chat",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontFamily: "Inter",),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
