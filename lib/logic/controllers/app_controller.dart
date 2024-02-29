import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mahmoud_fathi_start_tech_task/core/helper/snackbar_helper.dart';
import 'package:mahmoud_fathi_start_tech_task/core/utils/strings_manager.dart';
import 'package:mahmoud_fathi_start_tech_task/services/app_services.dart';
import 'package:mahmoud_fathi_start_tech_task/view/screens/auth/register_screen.dart';
import 'package:mahmoud_fathi_start_tech_task/view/screens/home_screen.dart';

class AppController extends GetxController {
  ///visibility of password
  bool isRegisterPasswordVisibility = false;
  bool isRegisterConfirmPasswordVisibility = false;
  bool isLoginPasswordVisibility = false;

  ///
  var isRegisterRequestLoading = false.obs;
  var isLoginRequestLoading = false.obs;
  var isSaveLoading = false.obs;
  var isDeleteLoading = false.obs;
  var storage = GetStorage();

  void registerPasswordVisibility() {
    isRegisterPasswordVisibility = !isRegisterPasswordVisibility;
    update();
  }

  void registerConfirmPasswordVisibility() {
    isRegisterConfirmPasswordVisibility = !isRegisterConfirmPasswordVisibility;
    update();
  }

  void loginPasswordVisibility() {
    isLoginPasswordVisibility = !isLoginPasswordVisibility;
    update();
  }

  void register(
      {required String name,
      required String email,
      required String phone,
      required String password,
      required String countryCode,
      required String confirmPassword}) async {
    isRegisterRequestLoading(true);
    await AppServices.registerRequest(
            name: name,
            email: email,
            phone: phone,
            password: password,
            countryCode: countryCode,
            confirmPassword: confirmPassword)
        .then((value) => value.fold((l) {
              SnackBarHelper.showErrorSnackBar(StringsManager.alert, l.message ?? '');
            }, (r) async {
              await storage.write(StringsManager.token, r.data!.token);
              Get.offAll(
                  HomeScreen(
                    userInfo: r,
                  ),
                  arguments: r);
            }));
    isRegisterRequestLoading(false);
  }

  void login({
    required String email,
    required String password,
  }) async {
    isLoginRequestLoading(true);
    await AppServices.loginRequest(email: email, password: password)
        .then((value) => value.fold((l) {
              SnackBarHelper.showErrorSnackBar(StringsManager.alert, l.message ?? '');
            }, (r) async {
              await storage.write(StringsManager.token, r.data!.token);
              Get.offAll(
                  HomeScreen(
                    userInfo: r,
                  ),
                  arguments: r);
            }));
    isLoginRequestLoading(false);
  }
  void updateInfo(
      {required String name,
        required String email,
        required String phone,
        required String countryCode}) async {
    isSaveLoading(true);
    await AppServices.updateInfoRequest(
        name: name,
        email: email,
        phone: phone,
        countryCode: countryCode,
        token: storage.read(StringsManager.token))
        .then((value) => value.fold((l) {
      SnackBarHelper.showErrorSnackBar(StringsManager.alert, l.message ?? '');
    }, (r) async {
      SnackBarHelper.showSuccessSnackBar(StringsManager.success, r.message ?? '');

      Get.offAll(
          HomeScreen(
            userInfo: r,
          ),
          arguments: r);
    }));
    isSaveLoading(false);
  }

  void deleteUser() async {
    isDeleteLoading(true);
    await AppServices.delete(
        token: storage.read(StringsManager.token))
        .then((value) {
      SnackBarHelper.showSuccessSnackBar(StringsManager.success, value.message ?? '');
      storage.remove(StringsManager.token);
      Get.offAll(
        RegisterScreen()
      );
    });
    isDeleteLoading(false);
  }
  void logout() {
    storage.remove(StringsManager.token);
    exit(0);
  }
}
