import 'package:get/get.dart';
import 'package:mahmoud_fathi_start_tech_task/logic/controllers/app_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AppController());
  }
}