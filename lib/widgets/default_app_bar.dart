


import 'package:flutter/material.dart';
import 'package:iti_coruses/services/extension.dart';

class MyAppBar extends StatelessWidget implements PreferredSize {
  const MyAppBar({
    super.key, required this.titleText,
  });
  final String titleText;

  @override
  Widget build(BuildContext context) {
    return AppBar(title:  Text(titleText),
    backgroundColor: context.theme.appBarTheme.backgroundColor,
    );
  }
  
  @override
  // TODO: implement child
  Widget get child => const SizedBox.shrink();
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}
