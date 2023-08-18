import 'package:flutter/material.dart';

class BoxedBox extends StatelessWidget {
  const BoxedBox({
    super.key,
    this.title,
    this.color,
  }):assert(title != null,"Sorry our box can't acccept null title"),
  assert(color != null,"color can't be null please pass color to the widget");
  final String? title;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 100,
      alignment: Alignment.center,
      color: color ?? Colors.orange,
      child: Text(
        title ?? "No Title",
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
