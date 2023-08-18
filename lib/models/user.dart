import 'package:flutter/foundation.dart' show immutable;

@immutable
class User {
  final String name;
  final int id;
  final String title;
  final String info;

  const User(
      {required this.name,
      required this.id,
      required this.title,
      required this.info});
  User copyWith({String? name, String? title, String? info}) {
    return User(
        name: name ?? this.name,
        id: id,
        title: title ?? this.title,
        info: info ?? this.title);
  }
}
