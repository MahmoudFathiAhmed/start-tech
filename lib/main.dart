import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mahmoud_fathi_start_tech_task/app/mahmoud_fathi_task.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}

