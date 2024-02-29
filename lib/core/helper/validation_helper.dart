import 'package:mahmoud_fathi_start_tech_task/core/utils/strings_manager.dart';
class ValidationHelper {
  static String? validatePhone(String? value) {
    String pattern = r'^[0-9]';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty || value.length < 9) {
      return StringsManager.enterCorrectPhoneNumber;
    } else if (!regExp.hasMatch(value)) {
      return StringsManager.enterValidPhoneNumber;
    }
    return null;
  }

  static String? validateConfirmPassword(String password,
      String confirmPassword) {
    if (password != confirmPassword) {
      return StringsManager.passwordMismatch;
    }
    return null;
  }

  static String? validateFullName(String? value) {
    if (value!.isEmpty) {
      return StringsManager.enterName;
    } else if (!RegExp(
        r'^[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z]+[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z- _]*$')
        .hasMatch(value)) {
      return StringsManager.enterName;
    }
    return null;
  }


  static String? validateEmail(String? value) {
    String pattern = r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$';// top level domain standards(TLD)
    RegExp regExp = RegExp(pattern);
    if(value!.isEmpty){
      return StringsManager.enterEmail;
    }else if (!regExp.hasMatch(value)) {
      return StringsManager.enterValidEmail;
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return StringsManager.enterPassword;
    } else if (password.length < 6) {
      return StringsManager.passwordMustBe6AtLeast;
    }  else {
      return null;
    }
  }

  static String? validateEmptyField(String? field) {
    if (field!.isEmpty) {
      return StringsManager.emptyValidation;
    }
    else {
      return null;
    }
  }
}