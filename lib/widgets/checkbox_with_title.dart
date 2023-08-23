import 'package:flutter/material.dart';




//Day6: Render vs Widget Vs Elements
//Keys : simple compare
class DefaultCheckboxWithTitle extends StatefulWidget {
  const DefaultCheckboxWithTitle({
    super.key,
  });

  @override
  State<DefaultCheckboxWithTitle> createState() =>
      _DefaultCheckboxWithTitleState();
}

class _DefaultCheckboxWithTitleState extends State<DefaultCheckboxWithTitle> {
  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: isChecked,
      onChanged: (bool? newValue) {
        setState(() {
          isChecked = newValue ?? false;
        });
      },
      title: const Text("Ahmed"),
      subtitle: const Text("Student"),
    );
  }
}


// (String? valName){
//                 return (valName?.length ?? 0) < 6
//                     ? "this name is very short"
//                     : null;
//               }