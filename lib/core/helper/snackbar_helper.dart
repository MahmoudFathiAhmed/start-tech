import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarHelper {
  static void showErrorSnackBar(String title, String message) {
    Get.showSnackbar(GetSnackBar(
      title: title,
      message: message,
      duration: const Duration(seconds: 4),
      backgroundColor: Colors.red.withOpacity(.8),
      icon: const Icon(Icons.error,color: Colors.white,),
      isDismissible: true,
      borderRadius: 24,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(20),
    ));
  }

  static void showSuccessSnackBar(String title, String message) {
    Get.showSnackbar(GetSnackBar(
        title: title,
        message: message,
        duration: const Duration(seconds: 4),
        isDismissible: true,
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 24,
        margin: const EdgeInsets.all(20),
        backgroundColor: Colors.green.withOpacity(.8)));
  }
}