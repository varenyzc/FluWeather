import 'package:fluweather/app/data/api/weather_api.dart';
import 'package:fluweather/app/data/repositories/weather_repository.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WeatherApi());
    Get.lazyPut(() => WeatherRepository());
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
