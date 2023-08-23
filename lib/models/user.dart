import 'package:flutter/foundation.dart' show immutable;

@immutable
class User {
  final String name;
  final int id;
  final String title;
  final String info;
  final bool isActive;

  const User({
    required this.name,
    required this.id,
    required this.title,
    required this.info,
    required this.isActive,
  });

  User copyWith({String? name, String? title, String? info, bool? isActive}) {
    return User(
        name: name ?? this.name,
        id: id,
        title: title ?? this.title,
        info: info ?? this.title,
        isActive: isActive ?? this.isActive);
  }

  User copyWithNewActiveStatus({bool? newStatus}) {
    return User(
      name: name,
      id: id,
      info:info,
      isActive: newStatus ?? isActive,
      title: title
    );
  }
}
