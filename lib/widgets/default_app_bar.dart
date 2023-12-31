import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iti_coruses/services/extension.dart';

import '../constants/icon_broken.dart';

class MyAppBar extends StatelessWidget implements PreferredSize {
  const MyAppBar({
    super.key,
    required this.titleText,
    this.actions,
    this.titleSpacing,
    this.leading,
  });

  final String titleText;
  final List<Widget>? actions;
  final double? titleSpacing;
  final bool? leading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(titleText),
      actions: actions ?? [],
      leading: leading == true
          ? IconButton(
              onPressed: () {
                context.navigator.pop();
              },
              icon: EasyLocalization.of(context)?.currentLocale ==
                      const Locale("en")
                  ? const Icon(IconBroken.Arrow___Left)
                  : const Icon(IconBroken.Arrow___Right))
          : Visibility(child: child),
      titleSpacing: titleSpacing ?? null,
      backgroundColor: context.theme.appBarTheme.backgroundColor,
    );
  }

  @override
  // TODO: implement child
  Widget get child => const SizedBox.shrink();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
