import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iti_coruses/constants/color_manager.dart';
import 'package:iti_coruses/screens/profile__screen.dart';
import 'package:iti_coruses/services/extension.dart';

import '../constants/icon_broken.dart';
import '../constants/route_names.dart';
import '../widgets/custom_button_widget.dart';
import '../widgets/custom_textFormField.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isPassShow = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey();

  @override
  void initState() {
    isPassShow = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formState,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 37.5,
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.width * 0.13),
                  height: MediaQuery.of(context).size.height * 0.115,
                  child: Image.asset("assets/images/img.png"),
                ),
                Text(
                  "Welcome_Back".tr(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Email Address Not br Empty";
                    }
                    return null;
                  },
                  text: "Email_Address".tr(),
                  hintText: "Enter_your_email".tr(),
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: IconBroken.Profile,
                  controller: emailController,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Password is Empty";
                    }
                    return null;
                  },
                  controller: passwordController,
                  isPassShow: isPassShow,
                  suffixPressed: () {
                    setState(() {
                      isPassShow = !isPassShow;
                    });
                  },
                  text: "Password".tr(),
                  hintText: "Password".tr(),
                  keyboardType: TextInputType.emailAddress,
                  suffixIcon:
                      isPassShow == true ? IconBroken.Hide : IconBroken.Show,
                  prefixIcon: IconBroken.Lock,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      "Forget_Password".tr(),
                      style: TextStyle(
                        fontSize: 16,
                        color: ColorManager.textColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                buildMaterialButton(context, () {
                  if (formState.currentState?.validate() == true) {
                    context.navigator.pushNamed(RouteNames.home);
                  }
                }, "Log_In".tr(), 20),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 1,
                        width: 110,
                        color: ColorManager.textColor,
                      ),
                      Text("Or_continue_with".tr(),
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Inter",
                              color: ColorManager.textColor)),
                      Container(
                        height: 1,
                        width: 110,
                        color: ColorManager.textColor,
                      ),
                    ],
                  ),
                ),
                Consumer(
                  builder: (context, ref, child) => OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                            width: 1.0,
                            color: (ref.watch(isDarkModelProvider)
                                ? Colors.white
                                : Colors.black)),
                        minimumSize: Size.copy(const Size(double.infinity, 65)),
                      ),
                      onPressed: () {},
                      label: Text("google".tr(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontSize: 18)),
                      icon: Image.asset(
                        "assets/images/img_5.png",
                        width: 30,
                        color: (ref.watch(isDarkModelProvider)
                            ? Colors.white
                            : Colors.black),
                      )),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(
                    vertical: 25,
                  ),
                  child: InkWell(
                      onTap: () {
                        context.navigator.pushNamed(RouteNames.signUpScreen);
                      },
                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                        Text("Don't_have_an_account".tr(),
                            style: TextStyle(
                              color: ColorManager.textColor,
                              fontSize: 16,
                            )),
                        Text("Sign_Up".tr(),
                            style: TextStyle(
                              color: ColorManager.mustardYellow,
                              fontSize: 17,
                            )),
                      ])),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
