import 'package:fluweather/app/data/providers/app_sp_service.dart';
import 'package:fluweather/app/data/providers/dio_config_service.dart';
import 'package:fluweather/app/data/providers/place_provider.dart';
import 'package:fluweather/app/data/remote/dio_client.dart';
import 'package:get/get.dart';

class DependenceInjection {
  static Future<void> init() async {
    await Get.putAsync(() => AppSpController().init());
    
    await Get.putAsync(() => DioConfigController().init());

    Get.put(DioClient());

    Get.put(PlaceProvider());
  }
}