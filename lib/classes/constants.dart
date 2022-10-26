class Constants {
  static const emailValidatorMessage = 'Please input a valid email address';
  static const nameValidatorMessage = 'Please input your name';
  static const passwordValidatorMessage = 'Please input a password';
  static const passwordValidatorMessage2 =
      'Password should be at least 7 characters with 1 capital letter, one number, and one special character.';
  static const confirmPasswordValidatorMessage =
      'Please input confirm your password';
  static const passwordsMatchMessage = 'Passwords match ✓';
  static const passwordsDontMatchMessage = 'Passwords don\'t match';

  static const getProductsApi = 'https://fakestoreapi.com/products';

  bool validateEmail(String value) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#\$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
  }

  bool validatePassword(String value) {
    return RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[!@#\$&*~]).{7,}$')
        .hasMatch(value);
  }

  bool checkPasswordMatch(String password, String confirmPassword) {
    return password == confirmPassword;
  }
}
