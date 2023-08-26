import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:iti_coruses/constants/color_manager.dart';
import 'package:iti_coruses/constants/icon_broken.dart';
import 'package:iti_coruses/constants/route_names.dart';
import 'package:iti_coruses/services/extension.dart';
import 'package:iti_coruses/widgets/default_app_bar.dart';
import 'package:iti_coruses/widgets/title_widget.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  int? isSelected;
  int? isSelectedListTitle;

  @override
  void initState() {
    isSelected = 0;
    isSelectedListTitle = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(titleText: "Schedule", leading: true, actions: [
        IconButton(onPressed: () {
          context.navigator.pushNamed(RouteNames.createNewTaskScreen);

        }, icon: const Icon(IconBroken.Plus))
      ]),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTitleWithPadding(context, DateFormat.MMMM().format(DateTime.now()).toString(),26),

            SizedBox(
              height: 70,
              child: ListView.separated(
                clipBehavior: Clip.none,
                shrinkWrap: true,
                itemCount: 100,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  DateTime date;
                  DateTime dateNow = DateTime.now().add(Duration(days: index));
                  date = DateTime(dateNow.year, dateNow.month, dateNow.day);
                  return InkWell(
                    onTap: () {
                      isSelected = index;
                      setState(() {});
                    },
                    child: Container(
                      height: 70,
                      width: 45,
                      color: isSelected == index
                          ? ColorManager.mustardYellow
                          : ColorManager.backFormColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            DateFormat.d().format(date).toString(),
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(
                                    fontSize: 18,
                                    color: isSelected == index
                                        ? Colors.black
                                        : Colors.white),
                          ),
                          Text(
                            DateFormat.E().format(date).toString(),
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                    fontSize: 10,
                                    color: isSelected == index
                                        ? Colors.black
                                        : Colors.white),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  width: 15,
                ),
              ),
            ),
            buildTitleWithPadding(context, "Today’s Tasks",26),
            Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            setState(() {
                              isSelectedListTitle = index;
                            });
                          },
                          child: Container(
                            height: 75,
                            constraints: const BoxConstraints(minHeight: 75),
                            padding: const EdgeInsets.only(
                                left: 0, right: 15, top: 0, bottom: 0),
                            color: isSelectedListTitle == index
                                ? ColorManager.mustardYellow
                                : ColorManager.backFormColor,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 11,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: ColorManager.mustardYellow,
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "User Interviews",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                              fontSize: 18,
                                              color:
                                                  isSelectedListTitle == index
                                                      ? Colors.black
                                                      : Colors.white),
                                    ),
                                    Text(
                                      "16:00 - 18:30",
                                      style: TextStyle(
                                          color: isSelectedListTitle == index
                                              ? Colors.black
                                              : Colors.white),
                                    ),
                                  ],
                                ),
                                 SizedBox(
                                  width: isSelectedListTitle == index
                                      ?  140:80,
                                ),
                                SizedBox(
                                  height: 30,
                                  width: 46,
                                  child: Stack(
                                    alignment: Alignment.centerLeft,
                                    children: [
                                      ...List.generate(
                                        index < 3 ? index + 1 : 2,
                                        (index) {
                                          double a = 0;
                                          List<double> end =
                                              List.generate(index + 1, (index) {
                                            a += 13;
                                            return a;
                                          });
                                          end.insert(0, 0);
                                          return Positioned(
                                              left: end[index],
                                              child: const CircleAvatar(
                                                radius: 10,
                                                backgroundImage: AssetImage(
                                                  "assets/images/img_7.png",
                                                ),
                                              ));
                                        },
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemCount: 5)),
          ],
        ),
      ),
    );
  }
}
