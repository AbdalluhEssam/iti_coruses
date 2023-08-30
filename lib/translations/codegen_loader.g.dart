// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart'
    show AssetLoader, EasyLocalization;
import 'package:flutter/material.dart';

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> en = {
    "Manage_your_Task_with": "Manage\nyour\nTask with",
    "DayTask": "DayTask",
    "Let's_Start": "Let's Start",
    "Welcome_Back": "Welcome Back!",
    "Email_Address": "Email Address",
    "Enter_your_email": "Enter your email",
    "Password": "Password",
    "Forget_Password": "Forgot Password?",
    "Log_In": "Log In",
    "Or_continue_with": "Or continue with",
    "Don't_have_an_account": "Don't have an account? ",
    "Sign_Up": "Sign Up",
    "Create_your_account": "Create your account",
    "Name": "Name",
    "google": "Google",
    "Full_Name": "Full Name",
    "I_have_read_&_agreed": "I have read & agreed to DayTask ",
    "Privacy_Policy": "Privacy Policy,\nTerms & Condition",
    "Already_have_an_account": "Already have an account?",
    "ongoingProjects": "Ongoing Projects",
    "see_all": "See All",
    "CompletedTasks": "Completed Tasks",
    "Search_tasks": "Search tasks",
    "Team_members": "Team members",
    "Due_on": "Due on",
    "home": "Home",
    "Chat": "Chat",
    "Calendar": "Calendar",
    "Notification": "Notification",

  };
  static const Map<String, dynamic> ar = {
    "Manage_your_Task_with": "إدار\n مهمتك\n مع",
    "DayTask": "مهمة اليوم",
    "Let's_Start": "هيا نبدا",
    "Welcome_Back": "مرحبًا بعودتك!",
    "Email_Address": "عنوان البريد الإلكتروني",
    "Enter_your_email": "أدخل بريدك الإلكتروني",
    "Password": "كلمة المرور",
    "Forget_Password": "هل نسيت كلمة السر؟",
    "Log_In": "تسجيل الدخول",
    "Or_continue_with": "الاستمرار معا",
    "Don't_have_an_account": "ليس لديك حساب؟ ",
    "Sign_Up": "انشاء حساب",
    "Create_your_account": "أنشئ حسابك",
    "Name": "الاسم",
    "google": "تسجيل الدخول باستخدام جوجل",
    "Full_Name": "الاسم الكامل",
    "I_have_read_&_agreed": "لقد قرأت ووافقت على مهمة اليوم ",
    "Privacy_Policy": " سياسة الخصوصية،\nلشروط والأحكام",
    "Already_have_an_account": "هل لديك حساب؟",
    "ongoingProjects": "مشاريع جارية",
    "see_all": "اظهار الكل",
    "CompletedTasks": "المهام المكتملة",
    "Search_tasks": "ابحث عن مهمه",
    "Team_members": "أعضاء الفريق",
    "Due_on": "يحدث فى",
    "home": "الرئيسية",
    "Chat": "المحادثات",
    "Calendar": "التقويم",
    "Notification": "الاشعارات",

  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "en": en,
    "ar": ar
  };
}

class LocalizationChecker {
  static changeLanguage(BuildContext context) {
    Locale? currentLocal = EasyLocalization.of(context)?.currentLocale;
    if (currentLocal == const Locale('en')) {
      EasyLocalization.of(context)?.setLocale(const Locale('ar'));
    } else {
      EasyLocalization.of(context)?.setLocale(const Locale('en'));
    }
  }
}
