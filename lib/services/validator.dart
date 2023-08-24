class Validator {
  Validator._();

// Singleton Design Pattern

  static String? validateName(String? name, [int requiredCharLength = 6]) {
    if (name == null) return null;
    return name.length < requiredCharLength ? "Short name" : null;
  }
}
