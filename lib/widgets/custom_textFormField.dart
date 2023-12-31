import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iti_coruses/constants/color_manager.dart';

import '../screens/profile__screen.dart';

class CustomTextFormField extends ConsumerWidget {
  final TextInputType? keyboardType;
  final String hintText;
  final String? text;
  final IconData? prefixIcon;
  final Color? color;

  final Color? colorBack;
  final Color? colorText;
  final double? padding;

  final IconData? suffixIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Function()? suffixPressed;
  final Function()? prefixIconPressed;
  final bool? isPassShow;
  final int? maxLines;
  final bool? readOnly;

  const CustomTextFormField({
    Key? key,
    this.keyboardType,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.text,
    required this.controller,
    required this.validator,
    this.suffixPressed,
    this.isPassShow,
    this.readOnly,
    this.color,
    this.colorBack,
    this.prefixIconPressed,
    this.colorText,
    this.padding,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (text != null)
          Text(
            text ?? "",
            style: TextStyle(
              fontSize: 15,
              color: colorText ?? (ref.watch(isDarkModelProvider) ? ColorManager.textColor : Colors.black) ,
            ),
          ),
        if (text != null)
          const SizedBox(
            height: 10,
          ),
        TextFormField(
          keyboardType: keyboardType ?? TextInputType.text,
          validator: validator,
          controller: controller,
          obscureText: isPassShow ?? false,
          readOnly: readOnly ?? false,
          maxLines: maxLines ?? 1,
          minLines: 1,
          style:  TextStyle(color: (ref.watch(isDarkModelProvider)
              ? Colors.white
              : Colors.black)),
          decoration: InputDecoration(
            fillColor: colorBack ??  (ref.watch(isDarkModelProvider) ? ColorManager.textFieldBackGround : Colors.grey.shade300),
            filled: true,
            // labelText: hintText ,
            labelStyle: TextStyle(color: ColorManager.textColor),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff455a64))),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff455a64))),
            contentPadding: EdgeInsets.only(
                left: padding ?? 10, right: 10, top: 10, bottom: 10),
            hintText: hintText,
            hintStyle: TextStyle(color: ColorManager.textColor),
            prefixIcon: prefixIconPressed != null
                ? IconButton(
                    icon: Icon(
                      prefixIcon,
                      color: color ??(ref.watch(isDarkModelProvider) ? Colors.white : ColorManager.textFieldBackGround),
                    ),
                    onPressed: prefixIconPressed,
                  )
                : prefixIcon != null
                    ? Icon(
                        prefixIcon,
                        color: color ??(ref.watch(isDarkModelProvider) ? Colors.white : ColorManager.textFieldBackGround),
                      )
                    : null,
            suffixIcon: suffixIcon != null
                ? IconButton(
                    icon: Icon(
                      suffixIcon,
                      color:color ??(ref.watch(isDarkModelProvider) ? Colors.white : ColorManager.textFieldBackGround),
                    ),
                    onPressed: suffixPressed,
                  )
                : null,
          ),
        ),
      ],
    );
  }
}

class CustomTextFormFieldDate extends StatelessWidget {
  final TextInputType? keyboardType;
  final String hintText;
  final String? text;
  final IconData? prefixIcon;
  final Color? color;

  final Color? colorBack;
  final Color? colorText;
  final double? padding;

  final IconData? suffixIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final Function()? suffixPressed;
  final Function()? prefixIconPressed;
  final bool? isPassShow;
  final int? maxLines;
  final bool? readOnly;

  const CustomTextFormFieldDate({
    Key? key,
    this.keyboardType,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.text,
    required this.controller,
    required this.validator,
    this.suffixPressed,
    this.isPassShow,
    this.readOnly,
    this.color,
    this.colorBack,
    this.prefixIconPressed,
    this.colorText,
    this.padding,
    this.maxLines,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.textFieldBackGround,
      child: TextFormField(
          readOnly: true,
          style: const TextStyle(
            color: Colors.white,
          ),
          controller: controller,
          decoration: InputDecoration(
            hintStyle: TextStyle(color: ColorManager.textColor),
            hintText: hintText,
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff455a64))),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff455a64))),
            contentPadding: EdgeInsets.only(
                left: padding ?? 10, right: 10, top: 10, bottom: 10),          ),
          onTap: onTap),
    );
  }
}
