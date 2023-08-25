import 'package:flutter/material.dart';
import 'package:iti_coruses/constants/color_manager.dart';

class CustomTextFormField extends StatelessWidget {
  final TextInputType? keyboardType;
  final String hintText;
  final String? text;
  final IconData? prefixIcon;
  final Color? color;

  final Color? colorBack;

  final IconData? suffixIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Function()? suffixPressed;
  final Function()? prefixIconPressed;
  final bool? isPassShow;

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
    this.colorBack, this.prefixIconPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (text != null)
          Text(
            text ?? "",
            style: TextStyle(
              fontSize: 15,
              color: ColorManager.textColor,
            ),
          ),
        if (text != null)
          const SizedBox(
            height: 10,
          ),
        Container(
          color: colorBack ?? ColorManager.textFieldBackGround,
          child: TextFormField(
            keyboardType: keyboardType ?? TextInputType.text,
            validator: validator,
            controller: controller,
            obscureText: isPassShow ?? false,
            readOnly: readOnly ?? false,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              // labelText: hintText ,
              labelStyle: TextStyle(color: ColorManager.textColor),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff455a64))),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff455a64))),
              contentPadding: const EdgeInsets.all(10),
              hintText: hintText,
              hintStyle: TextStyle(color: ColorManager.textColor),
              prefixIcon: prefixIconPressed != null
                  ? IconButton(
                      icon: Icon(
                        prefixIcon,
                        color: color ?? Colors.white,
                      ),
                      onPressed: prefixIconPressed,
                    )
                  : Icon(
                      prefixIcon,
                      color: color ?? Colors.white,
                    ),
              suffixIcon: suffixIcon != null
                  ? IconButton(
                      icon: Icon(
                        suffixIcon,
                        color: color ?? Colors.white,
                      ),
                      onPressed: suffixPressed,
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
