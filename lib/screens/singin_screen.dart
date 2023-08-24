import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti_coruses/constants/color_manager.dart';
import 'package:iti_coruses/services/extension.dart';
import '../constants/route_names.dart';
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
                  "Welcome Back!",
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
                      return "Email Address Not br Empty";
                    }
                    return null;
                  },
                  text: "Email Address",
                  hintText: "Email",
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Image.asset("assets/images/img_2.png"),
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
                      ? const Icon(
                          CupertinoIcons.eye,
                          color: Colors.white,
                        )
                      : Container(
                          margin: const EdgeInsets.all(4),
                          child: Image.asset("assets/images/img_4.png")),
                  prefixIcon: Container(
                      width: 10,
                      height: 10,
                      margin: const EdgeInsets.all(12),
                      child: Image.asset("assets/images/img_3.png")),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      "Forgot Password?",
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
                MaterialButton(
                  onPressed: () {
                    if (formState.currentState?.validate() == true) {
                      context.navigator.pushNamed(RouteNames.signUpScreen);
                    }
                  },
                  color: const Color(0xfffed36a),
                  height: 65,
                  minWidth: 400,
                  child: const Text("Log In",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
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
                    label: const Text("Google",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        )),
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
