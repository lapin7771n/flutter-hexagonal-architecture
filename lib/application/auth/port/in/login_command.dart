class LoginCommand {
  final String email;
  final String password;

  LoginCommand(this.email, this.password)
      : assert(email.isValidEmail),
        assert(password.isValidPassword);
}

extension Validator on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    return length >= 8;
  }
}
