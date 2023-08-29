import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iti_coruses/constants/color_manager.dart';
import 'package:iti_coruses/constants/icon_broken.dart';
import 'package:iti_coruses/screens/calendar_screen.dart';
import 'package:iti_coruses/screens/notifications_screen.dart';
import 'package:iti_coruses/services/extension.dart';

import '../constants/route_names.dart';
import 'chat_screen.dart';
import 'home_page.dart';
import 'newmassage_screen.dart';

final StateProvider<int> bottomBarIndexProvider = StateProvider<int>((_) {
  return 0;
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    const String websiteID = "5c5651be-a2d9-4c66-82dc-5fd1d7d63109";

    List pages = [
      const HomePage(),
      const ChatScreen(),
      const NewMassageScreen(),
      const CalendarScreen(),
      const NotificationsScreen(),
    ];
    List<BottomNavigationBarItem> itemBottomNavBat = [
      const BottomNavigationBarItem(icon: Icon(IconBroken.Home), label: "Home"),
      const BottomNavigationBarItem( icon: Icon(IconBroken.Chat), label: "Chat"),
      BottomNavigationBarItem( icon: Transform.translate(
        offset: const Offset(0, 5),
        child: MaterialButton(
            color: ColorManager.mustardYellow,
            height: 55,
            minWidth: 50,
            onPressed: ()

            // async {
            //   await FlutterCrispChat.openCrispChat(
            //     websiteID: websiteID,
            //   );
            // }

            {
              context.navigator.pushNamed(RouteNames.newMassageScreen);
            }

            ,
            child: Icon(
              IconBroken.Plus,
              color: ColorManager.textField,
              size: 30,
            )),
      ),label: ""),
      const BottomNavigationBarItem(icon: Icon(IconBroken.Calendar), label: "Calendar"),
      const BottomNavigationBarItem(icon: Icon(IconBroken.Notification), label: "Notification"),
    ];

    return Scaffold(
      appBar: AppBar(toolbarHeight: 0,),
      body: pages.elementAt(ref.watch(bottomBarIndexProvider)),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: ColorManager.textColor,
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle: TextStyle(color: ColorManager.textField),
        selectedIconTheme: IconThemeData(color: ColorManager.mustardYellow),
        selectedLabelStyle: TextStyle(color: ColorManager.mustardYellow),
        onTap: (value) {
          ref.read(bottomBarIndexProvider.notifier).update((int state) => value);
        },
        selectedItemColor: ColorManager.mustardYellow,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: ref.watch(bottomBarIndexProvider.notifier).state,
        items: itemBottomNavBat,
        elevation: 1,
      ),
    );
  }
}