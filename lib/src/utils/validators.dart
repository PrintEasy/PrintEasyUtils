import 'package:get/get.dart';

class AppValidators {
  const AppValidators._();

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Required';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Invalid Email';
    }

    return null;
  }

  static String? userName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Required';
    }
    return null;
  }

  static String? phoneNumber(
    String? value, [
    int minLength = 10,
  ]) {
    if (value == null || value.isEmpty) {
      return 'Required';
    }
    if (value.length < minLength) {
      return 'Phone must have atleast $minLength numbers';
    }
    return null;
  }
}
