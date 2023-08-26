import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iti_coruses/constants/color_manager.dart';
import 'package:iti_coruses/constants/icon_broken.dart';
import 'package:iti_coruses/widgets/custom_button_widget.dart';
import 'package:iti_coruses/widgets/default_app_bar.dart';
import 'package:iti_coruses/widgets/title_widget.dart';

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

class TaskDetailsScreen extends ConsumerWidget {
  const TaskDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorManager.textField,
      appBar: MyAppBar(
        leading: true,
        titleText: "Task Details",
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                buildTitle(context,  "Real Estate App Design",fontSize: 21),

                Padding(
                  padding: const EdgeInsets.only(top: 27, bottom: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 47,
                            height: 47,
                            color: ColorManager.mustardYellow,
                            child: const Icon(IconBroken.Calendar, size: 24),
                          ),
                          const SizedBox(
                            width: 14,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Due Date",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                        color: ColorManager.textColor,
                                        fontSize: 11),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "20 June",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(fontSize: 17),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(width: 10,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 47,
                            height: 47,
                            color: ColorManager.mustardYellow,
                            child: const Icon(IconBroken.User, size: 24),
                          ),
                          const SizedBox(
                            width: 14,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Project Team",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                        color: ColorManager.textColor,
                                        fontSize: 11),
                              ),

                              SizedBox(
                                height: 30,
                                width: 46,
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    ...List.generate(
                                      3,
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
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox()
                    ],
                  ),
                ),
                Text(
                  "Project Details",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.normal, fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 9,
                  ),
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled",
                    style:
                        TextStyle(color: ColorManager.textColor, fontSize: 12),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Project Progress",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.normal, fontSize: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 60,
                              height: 60,
                              child: CircularProgressIndicator(
                                value: 0.6,
                                color: ColorManager.mustardYellow,
                                strokeWidth: 2,
                                backgroundColor: ColorManager.textFieldBackGround,
                              ),
                            ),
                            Text(
                              "60%",
                              style: Theme.of(context).textTheme.labelMedium,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "All Tasks",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.normal, fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
            ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => ListTile(
                      contentPadding: const EdgeInsets.only(
                          left: 19, right: 10, top: 9, bottom: 9),
                      iconColor: Colors.black,
                      tileColor: ColorManager.textFieldBackGround,
                      title: const Text("User Interviews",
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      trailing: Consumer(
                        builder: (BuildContext context, WidgetRef ref,
                                Widget? child) =>
                            Container(
                          color: ColorManager.mustardYellow,
                          child: IconButton(
                              onPressed: () {
                                ref.read(checkStateProvider.notifier.select((value) => value.check()));
                              },
                              icon:  Icon(
                                ref.watch(checkStateProvider.notifier).check()
                                    ? Icons.check_circle_outline
                                    : Icons.circle_outlined,
                                size: 30,
                              )),
                        ),
                      ),
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 12,
                    ),
                itemCount: 10)
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        color: ColorManager.textField,
        child: buildMaterialButton(context, () { }, "Add Task",20),
      ),
    );
  }
}
