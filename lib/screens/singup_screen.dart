import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti_coruses/constants/color_manager.dart';
import 'package:iti_coruses/constants/icon_broken.dart';
import 'package:iti_coruses/services/extension.dart';
import '../constants/route_names.dart';
import '../widgets/custom_textFormField.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<SignUpScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignUpScreen> {
  bool isPassShow = false;
  bool isActive = false;
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
      // appBar: const MyAppBar(titleText: ""),
      backgroundColor: ColorManager.textField,
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
                  height: 100,
                  child: Image.asset("assets/images/img.png"),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Create your account",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Name is Empty";
                    }
                    return null;
                  },
                  text: "Full Name",
                  hintText: "Full Name",
                  keyboardType: TextInputType.name,
                  prefixIcon: IconBroken.User,
                  controller: emailController,
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
                  text: "Email Address",
                  hintText: "Email",
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
                  text: "Password",
                  hintText: "Password",
                  keyboardType: TextInputType.emailAddress,
                  suffixIcon: isPassShow == true
                      ? CupertinoIcons.eye_slash
                      : IconBroken.Show,
                  prefixIcon: IconBroken.Lock,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                     IconButton(
                        alignment: AlignmentDirectional.centerStart,
                        padding:const EdgeInsetsDirectional.only(start: 0,top: 8),
                        onPressed: () {
                          isActive = !isActive;
                          setState(() {

                          });
                        },
                        icon: Icon(IconBroken.Tick_Square,
                            color:isActive == true ? ColorManager.mustardYellow : ColorManager.textColor)),
                    Flexible(
                      child: RichText(
                        text: TextSpan(
                            text: "I have read & agreed to DayTask",
                            style: TextStyle(
                              color: ColorManager.textColor,
                              fontSize: 14,
                            ),
                            children: [
                              TextSpan(
                                text: "  Privacy Policy, Terms & Condition",
                                style: TextStyle(
                                  color: ColorManager.mustardYellow,
                                  fontSize: 14,
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                MaterialButton(
                  onPressed: () {
                    if (formState.currentState?.validate() == true) {
                      context.navigator.pushNamed(RouteNames.signInScreen);
                    }
                  },
                  color: const Color(0xfffed36a),
                  height: 65,
                  minWidth: 400,
                  child:  Text("Log In",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.black)),
                ),
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
                      Text("Or continue with",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: ColorManager.textColor)),
                      Container(
                        height: 1,
                        width: 110,
                        color: ColorManager.textColor,
                      ),
                    ],
                  ),
                ),
                OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(width: 1.0, color: Colors.white),
                      minimumSize: Size.copy(const Size(double.infinity, 65)),
                    ),
                    onPressed: () {},
                    label:  Text("Google",
                        style: Theme.of(context).textTheme.bodyLarge),
                    icon: Image.asset(
                      "assets/images/img_5.png",
                      width: 30,
                    )),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  child: InkWell(
                      onTap: () {},
                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                        Text("Don’t have an account?",
                            style: TextStyle(
                              color: ColorManager.textColor,
                              fontSize: 16,
                            )),
                        Text(" Sign Up",
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
