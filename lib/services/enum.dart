
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
