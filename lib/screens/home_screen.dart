import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iti_coruses/constants/color_manager.dart';
import 'package:iti_coruses/constants/icon_broken.dart';

import 'chat_screen.dart';
import 'home_page.dart';

final StateProvider<int> bottomBarIndexProvider = StateProvider<int>((_) {
  return 0;
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List pages = [
      const HomePage(),
      const ChatScreen(),
      const HomePage(),
      const HomePage(),
      const HomePage(),
    ];

    return Scaffold(
      appBar: AppBar(toolbarHeight: 0,),
      backgroundColor: ColorManager.textField,
      body: pages.elementAt(ref.watch(bottomBarIndexProvider)),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: ColorManager.textColor,
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle: TextStyle(color: ColorManager.textField),
        selectedIconTheme: IconThemeData(color: ColorManager.mustardYellow),
        selectedLabelStyle: TextStyle(color: ColorManager.mustardYellow),
        onTap: (value) {
          ref.read(bottomBarIndexProvider.notifier)
              .update((int state) => value);
        },
        backgroundColor: ColorManager.textField,
        selectedItemColor: ColorManager.mustardYellow,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: ref.watch(bottomBarIndexProvider.notifier).state,
        items: [
          const BottomNavigationBarItem(
              icon: Icon(IconBroken.Home), label: "Home"),
          const BottomNavigationBarItem(
              icon: Icon(IconBroken.Chat), label: "Chat"),
          BottomNavigationBarItem(
              icon: Transform.translate(
                offset: const Offset(0, 5),
                child: MaterialButton(
                    color: ColorManager.mustardYellow,
                    height: 55,
                    minWidth: 50,
                    onPressed: () {},
                    child: Icon(
                      IconBroken.Plus,
                      color: ColorManager.textField,
                      size: 30,
                    )),
              ),
              label: ""),
          const BottomNavigationBarItem(
              icon: Icon(IconBroken.Calendar), label: "Calendar"),
          const BottomNavigationBarItem(
              icon: Icon(IconBroken.Notification), label: "Notification"),
        ],
        elevation: 1,
      ),
    );
  }
}
