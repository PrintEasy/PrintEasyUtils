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


   /// Validates price fields (positive number)
  static String? price(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Required';
    }
    final parsed = double.tryParse(value.trim());
    if (parsed == null || parsed < 0) {
      return 'Enter a valid price';
    }
    return null;
  }


   /// Validates percentage (0–100)
  static String? percentage(String? value) {
    if (value == null || value.trim().isEmpty) return null; // allow blank
    final parsed = double.tryParse(value.trim());
    if (parsed == null || parsed < 0 || parsed > 100) {
      return 'Enter a valid percentage (0–100)';
    }
    return null;
  }


   /// Validates min order amount (non-zero positive number)
  static String? minOrderAmount(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Required';
    }
    final parsed = double.tryParse(value.trim());
    if (parsed == null || parsed <= 0) {
      return 'Enter a valid minimum amount';
    }
    return null;
  }

  /// Validates product ID (for gift type = product)
  static String? productId(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Product ID required';
    }
    return null;
  }



  // ✅ Required: Non-empty number
  static String? numberRequired(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Required';
    }
    final parsed = double.tryParse(value.trim());
    if (parsed == null) {
      return 'Enter a valid number';
    }
    return null;
  }

  // ✅ Optional number (if not empty, must be a valid number)
  static String? optionalNumber(String? value) {
    if (value == null || value.trim().isEmpty) return null;
    final parsed = double.tryParse(value.trim());
    if (parsed == null) {
      return 'Enter a valid number';
    }
    return null;
  }

  // ✅ Optional text (no validation, but trims it)
  static String? optionalText(String? value) {
    return null; // Always valid
  }

}
