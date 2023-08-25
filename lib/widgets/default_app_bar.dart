import 'package:flutter/material.dart';
import 'package:iti_coruses/services/extension.dart';

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
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(titleText),
      actions: actions ?? [],
      leading: leading ?? null,
      titleSpacing: titleSpacing ?? null,
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
