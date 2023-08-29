import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iti_coruses/res.dart';
import 'package:iti_coruses/screens/profile__screen.dart';
import 'package:iti_coruses/services/extension.dart';
import 'package:iti_coruses/widgets/title_widget.dart';

import '../constants/color_manager.dart';
import '../constants/icon_broken.dart';
import '../widgets/custom_textFormField.dart';
import '../widgets/home_page_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
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
              buildNameAndImage(context, assets: Res.circleAvatar,onTap: () {
                context.navigator.push(MaterialPageRoute(
                    builder: (context) => const ProfileScreen(
                      assetName: "assets/images/img_7.png",
                      subTitleName: "Online",
                      titleName: "Abdalluh Essam",
                      email: "abdallhessam100@gmail.com",
                    )));
              }),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 14),
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
                  buildTitleWithRow(context, title: "Completed Tasks", subTitle: "See all"),
                  buildTasksBox()
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  children: [
                    buildTitleWithRow(context, title: "Ongoing Projects", subTitle: "See all"),
                    buildOngoingBox(itemCount: 10, colors:(ref.watch(isDarkModelProvider)
                        ? ColorManager.textFieldBackGround
                        : Colors.grey.withOpacity(0.5)) )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
