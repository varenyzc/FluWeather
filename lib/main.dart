import 'package:flutter/material.dart';
import 'package:fluweather/app/data/theme/app_theme.dart';
import 'package:fluweather/app/routes/app_pages.dart';
import 'package:get/get.dart';

import 'app/utils/dependence_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependenceInjection.init();

  runApp(GetMaterialApp(
    title: "FluWeather",
    initialRoute: AppPages.INITIAL,
    getPages: AppPages.routes,
    debugShowCheckedModeBanner: false,
    theme: appThemeData,
  ));
}