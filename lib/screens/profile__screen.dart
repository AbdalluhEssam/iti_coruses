import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iti_coruses/constants/color_manager.dart';
import 'package:iti_coruses/constants/icon_broken.dart';
import 'package:iti_coruses/widgets/custom_textFormField.dart';
import 'package:iti_coruses/widgets/default_app_bar.dart';

final StateProvider<bool> isDarkModelProvider =
    StateProvider<bool>((StateProviderRef<bool> ref) {
  return false;
});

final Provider<ThemeData> anotherDarkModeProvider =
    Provider<ThemeData>((ProviderRef<ThemeData> ref) {
  return ref.watch(isDarkModelProvider) ? ThemeData.dark() : ThemeData.light();
});

class ProfileScreen extends StatelessWidget {
  const ProfileScreen(
      {super.key,
      required this.assetName,
      required this.titleName,
      required this.email,
      required this.subTitleName});

  final String assetName;
  final String titleName;
  final String subTitleName;
  final String email;

  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController tasksController = TextEditingController();
    TextEditingController privacyController = TextEditingController();
    TextEditingController settingController = TextEditingController();

    userNameController.text = titleName;
    emailController.text = email;

    return Scaffold(
      appBar: const MyAppBar(
        titleText: "Profile",
        leading: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 65,
                      backgroundColor: ColorManager.mustardYellow,
                      child: CircleAvatar(
                        radius: 62,
                        backgroundColor: ColorManager.textField,
                        child: CircleAvatar(
                          radius: 58,
                          backgroundImage: AssetImage(assetName),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 2,
                      bottom: 2,
                      child: CircleAvatar(
                        radius: 19,
                        backgroundColor: ColorManager.textField,
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              IconBroken.Plus,
                              color: Colors.white,
                              size: 22,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 42,
              ),
              CustomTextFormField(
                prefixIcon: IconBroken.Add_User,
                suffixIcon: IconBroken.Edit_Square,
                suffixPressed: () {},
                color: ColorManager.textColor,
                hintText: "User Name",
                controller: userNameController,
                validator: (val) {
                  if (val?.isEmpty == true) {
                    return "name is availed";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 26,
              ),
              CustomTextFormField(
                prefixIcon: Icons.person_pin_outlined,
                suffixIcon: IconBroken.Edit_Square,
                suffixPressed: () {},
                color: ColorManager.textColor,
                hintText: "Email",
                controller: emailController,
                validator: (val) {
                  if (val?.isEmpty == true) {
                    return "Email is availed";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 26,
              ),
              CustomTextFormField(
                prefixIcon: IconBroken.Lock,
                suffixIcon: IconBroken.Edit_Square,
                suffixPressed: () {},
                color: ColorManager.textColor,
                hintText: "Password",
                controller: passwordController,
                validator: (val) {
                  if (val?.isEmpty == true) {
                    return "Password is availed";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 26,
              ),
              CustomTextFormField(
                prefixIcon: Icons.checklist_rounded,
                suffixIcon: IconBroken.Arrow___Down_2,
                suffixPressed: () {},
                color: ColorManager.textColor,
                hintText: "My Tasks",
                controller: tasksController,
                validator: (val) {
                  if (val?.isEmpty == true) {
                    return "Password is availed";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 26,
              ),
              CustomTextFormField(
                prefixIcon: Icons.admin_panel_settings_outlined,
                suffixIcon: IconBroken.Arrow___Down_2,
                suffixPressed: () {},
                color: ColorManager.textColor,
                hintText: "Privacy",
                controller: privacyController,
                validator: (val) {
                  if (val?.isEmpty == true) {
                    return "Password is availed";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 26,
              ),
              CustomTextFormField(
                prefixIcon: IconBroken.Setting,
                suffixIcon: IconBroken.Arrow___Down_2,
                suffixPressed: () {},
                color: ColorManager.textColor,
                hintText: "Setting",
                controller: settingController,
                validator: (val) {
                  if (val?.isEmpty == true) {
                    return "Password is availed";
                  }
                  return null;
                },
              ),
              Consumer(
                builder: (context, ref, child) => SwitchListTile.adaptive(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: -10, vertical: 15),
                    selected: true,
                    title:  Text("Change Theme" ,style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 18)),
                    value: ref.watch(isDarkModelProvider),
                    onChanged: (bool isEnabled) {
                      ref
                          .read(isDarkModelProvider.notifier)
                          .update((bool state) => isEnabled);
                    }),
              ),

              SizedBox(
                height: 55,
                width: double.infinity,
                child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        primary: ColorManager.mustardYellow,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 10)),
                    onPressed: () {},
                    icon: Icon(
                      IconBroken.Logout,
                      color: ColorManager.textField,
                      size: 25,
                      shadows: const [
                        Shadow(color: Colors.black, blurRadius: 2)
                      ],
                    ),
                    label: Text(
                      "Logout",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: ColorManager.textField, fontSize: 18),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
