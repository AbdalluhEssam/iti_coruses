import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iti_coruses/constants/color_manager.dart';

import '../constants/icon_broken.dart';
import '../screens/providers_screens/state_provider.dart';
import 'custom_textFormField.dart';
class BuildMessage extends ConsumerWidget {
  final String? text;
  final String? image;

  const BuildMessage( {
    Key? key,
    this.text, this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: text != null
          ? Container(
        constraints: const BoxConstraints(maxWidth: 300),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color:ref.watch(isDarkModelProvider) ? ColorManager.textField : ColorManager.backFormColor,
            borderRadius: const BorderRadiusDirectional.only(
              bottomEnd: Radius.circular(5),
              bottomStart: Radius.circular(5),
              topEnd: Radius.circular(5),
            )),
        child: Text(
          text?? "",
          style: const TextStyle(
            fontSize: 16,
            fontFamily: "Inter",
            fontWeight: FontWeight.normal,
          ),
        ),
      )
          : Container(
          constraints: const BoxConstraints(maxWidth: 250, maxHeight: 213),
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Image.asset(
            image!,
            fit: BoxFit.cover,
          )),
    );
  }
}

Widget buildMyMessage(context, {String? text, String? image}) => Align(
      alignment: AlignmentDirectional.centerEnd,
      child: text != null
          ? Container(
              constraints: const BoxConstraints(maxWidth: 300),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: ColorManager.mustardYellow,
                  borderRadius: const BorderRadiusDirectional.only(
                    bottomEnd: Radius.circular(5),
                    bottomStart: Radius.circular(5),
                    topStart: Radius.circular(5),
                  )),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                        fontSize: 16,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                  ),
                  const Positioned(
                    right: -10,
                    bottom: -12,
                    child: Text(
                      "Seen",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 8,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Inter"),
                    ),
                  )
                ],
              ),
            )
          : Container(
              constraints: const BoxConstraints(maxWidth: 250, maxHeight: 213),
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Image.asset(
                image!,
                fit: BoxFit.cover,
              )),
    );

Widget buildBottomNavBar(TextEditingController messageController) => Container(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
              flex: 4,
              child: CustomTextFormField(
                colorBack: ColorManager.backFormColor,
                suffixIcon: IconBroken.Send,
                prefixIcon: IconBroken.Category,
                prefixIconPressed: () {},
                suffixPressed: () {},
                hintText: "Type a message",
                color: ColorManager.mustardYellow,
                controller: messageController,
                validator: (val) {
                  if (val?.isEmpty == true) {
                    return "";
                  }

                  return null;
                },
              )),
          const SizedBox(
            width: 8,
          ),
          Container(
            width: 57,
            color: ColorManager.backFormColor,
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  IconBroken.Voice_2,
                  color: ColorManager.mustardYellow,
                )),
          ),
        ],
      ),
    );
