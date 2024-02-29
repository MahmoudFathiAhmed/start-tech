import 'package:get/get.dart';
import 'package:mahmoud_fathi_start_tech_task/logic/bindings/app_binding.dart';
import 'package:mahmoud_fathi_start_tech_task/models/auth_model.dart';
import 'package:mahmoud_fathi_start_tech_task/view/screens/auth/login_screen.dart';
import 'package:mahmoud_fathi_start_tech_task/view/screens/auth/register_screen.dart';
import 'package:mahmoud_fathi_start_tech_task/view/screens/home_screen.dart';
import 'package:mahmoud_fathi_start_tech_task/view/screens/update_info_screen.dart';
import 'package:mahmoud_fathi_start_tech_task/view/screens/welcome_screen.dart';

class AppRoutes{
  // initialRoute
  static const welcome = Routes.welcome;
  // getPages
  static final routes = [
    GetPage(
      name: Routes.welcome,
      page: ()=>const WelcomeScreen(),
    ),
    GetPage(
      name: Routes.login,
      page: ()=> LoginScreen(),
      binding: AppBinding(),
    ),
    GetPage(
      name: Routes.register,
      page: ()=> RegisterScreen(),
      binding: AppBinding(),
    ),
    GetPage(
      name: Routes.updateInfo,
      page: ()=> UpdateInfoScreen(userInfo: Get.arguments as AuthModel),
      binding: AppBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: ()=> HomeScreen(userInfo: Get.arguments as AuthModel),
      // binding: AppBinding(),
    ),
  ];
}
class Routes {
  static const welcome = '/welcomeScreen';
  static const login = '/loginScreen';
  static const register = '/registerScreen';
  static const home = '/homeScreen';
  static const updateInfo = '/updateInfoScreen';

}