import 'package:flutter/material.dart';
import 'package:iti_coruses/constants/route_names.dart';
import 'package:iti_coruses/screens/profile__screen.dart';
import 'package:iti_coruses/services/extension.dart';

import '../constants/color_manager.dart';
import '../constants/icon_broken.dart';
import '../widgets/custom_textFormField.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome Back!",
                        style: TextStyle(
                            fontSize: 15, color: ColorManager.mustardYellow),
                      ),
                      const Text(
                        "Fazil Laghari",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontFamily: "PilatExtended"),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: (){
                      context.navigator.push(MaterialPageRoute(
                          builder: (context) => const ProfileScreen(
                            assetName: "assets/images/img_7.png",
                            subTitleName: "Online",
                            titleName: "Abdalluh Essam",
                            email: "abdallhesam100@gmail.com",
                          )));
                    },
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("assets/images/img_7.png"),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        hintText: "Search tasks",
                        prefixIcon: IconBroken.Search,
                        controller: searchController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "NO Word";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 50,
                        height: 45,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: ColorManager.mustardYellow,
                        ),
                        child: const Icon(IconBroken.Filter),
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Completed Tasks",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text("See all",
                            style: Theme.of(context).textTheme.headlineLarge),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 175,
                    child: ListView.separated(
                      clipBehavior: Clip.none,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          context.navigator
                              .pushNamed(RouteNames.taskDetailsScreen);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          width: 185,
                          height: 175,
                          decoration: BoxDecoration(
                              color: index == 0
                                  ? ColorManager.mustardYellow
                                  : ColorManager.textFieldBackGround),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                  "Real Estate Website Design",
                                  style: index == 0
                                      ? Theme.of(context).textTheme.labelLarge
                                      : Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .copyWith(color: Colors.white),
                                ),
                              ),
                              Flexible(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Team members",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: "Inter",
                                          color: index == 0
                                              ? Colors.black
                                              : Colors.white),
                                    ),
                                    Flexible(
                                      child: Stack(
                                        alignment: Alignment.centerRight,
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        children: [
                                          ...List.generate(
                                            5,
                                            (index) {
                                              double a = 0;
                                              List<double> end = List.generate(
                                                  index + 1, (index) {
                                                a += 13;
                                                return a;
                                              });
                                              end.insert(0, 0);
                                              return Positioned(
                                                  right: end[index],
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
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                  child: Column(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Completed",
                                          style: TextStyle(
                                              fontFamily: "Inter",
                                              fontSize: 12,
                                              color: index == 0
                                                  ? Colors.black
                                                  : Colors.white),
                                        ),
                                        Text(
                                          "100%",
                                          style: TextStyle(
                                              fontFamily: "Inter",
                                              fontSize: 12,
                                              color: index == 0
                                                  ? Colors.black
                                                  : Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    child: LinearProgressIndicator(
                                      color: ColorManager.linearColor,
                                      value: index == 0 ? 100 : 0,
                                      backgroundColor: Colors.white,
                                    ),
                                  )
                                ],
                              ))
                            ],
                          ),
                        ),
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 10,
                      ),
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Ongoing Projects",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text("See all",
                              style: Theme.of(context).textTheme.headlineLarge),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Container(
                              width: 390,
                              height: 130,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: ColorManager.textFieldBackGround),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Mobile App Wireframe",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Team members",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium,
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            SizedBox(
                                              height: 30,
                                              child: Stack(
                                                children: [
                                                  ...List.generate(
                                                    3,
                                                    (index) {
                                                      double a = 0;
                                                      List<double> end =
                                                          List.generate(
                                                              index + 1,
                                                              (index) {
                                                        a += 13;
                                                        return a;
                                                      });
                                                      end.insert(0, 0);
                                                      return Positioned(
                                                          left: end[index],
                                                          child:
                                                              const CircleAvatar(
                                                            radius: 10,
                                                            backgroundImage:
                                                                AssetImage(
                                                              "assets/images/img_7.png",
                                                            ),
                                                          ));
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text(
                                              "Due on : 21 March",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium,
                                            )
                                          ],
                                        ),
                                      ),
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          SizedBox(
                                            width: 59,
                                            height: 59,
                                            child: CircularProgressIndicator(
                                              value: 0.75,
                                              color: ColorManager.mustardYellow,
                                              backgroundColor:
                                                  ColorManager.textField,
                                              strokeWidth: 3,
                                            ),
                                          ),
                                          Text(
                                            "75 %",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 20,
                            ),
                        itemCount: 5)
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
