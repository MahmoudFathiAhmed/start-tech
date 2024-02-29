import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahmoud_fathi_start_tech_task/core/routes/app_routes.dart';
import 'package:mahmoud_fathi_start_tech_task/core/utils/strings_manager.dart';
import 'package:mahmoud_fathi_start_tech_task/core/utils/themes_manager.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();
  static const MyApp _instance = MyApp._internal();
  factory MyApp() => _instance;
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: StringsManager.appName,
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
      initialRoute: AppRoutes.welcome,
      getPages: AppRoutes.routes,
    );
  }
}