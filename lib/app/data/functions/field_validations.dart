mixin FieldValidaion {
  String? emptyValidation(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return fieldName;
    }

    return null;
  }

  /// ## Email Validation
  /// * check null or is empty
  /// * trim
  /// * done not match regex pattern
  String? emailValidation(email) {
    String emailValidationPattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp emailRegExp = RegExp(emailValidationPattern);

    if (email == null || email.isEmpty) {
      return 'Please enter your email';
    }

    final _email = email.trim();

    if (!emailRegExp.hasMatch(_email)) {
      return 'Please enter a valid email address';
    }

    return null;
  }
}
