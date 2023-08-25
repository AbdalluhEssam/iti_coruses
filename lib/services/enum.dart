

import 'package:flutter/material.dart';

enum UserGender {
  male("Male"),
  female("Female"),
  undefined(null);

  const UserGender(this.type);

  final String? type;
}

enum PaymentMethod {
  notSelected(null),
  cash("Cash on delivery"),
  credit("Credit Card"),
  fawry("Fawry"),
  tamara("Tamara"),
  valu("ValU"),
  contact("Contact"),
  premiumCard("Premium Card");

  const PaymentMethod(this.type);

  final String? type;
}


// enum Pages {
//   notification((name : "", icon: Icons.notifications_active,index: 0)),
//   home((name: "Home", icon: Icons.home,index: 1)),
//   profile((name: "Profile", icon: Icons.account_circle_outlined,index: 2));
//
//   const Pages(this.element);
//
//   final ({required String name, required IconData icon,required int index}) element;
// }