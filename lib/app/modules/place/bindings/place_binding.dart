import 'package:fluweather/app/data/api/place_api.dart';
import 'package:fluweather/app/data/repositories/place_repository.dart';
import 'package:get/get.dart';

import '../controllers/place_controller.dart';

class PlaceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PlaceApi());
    Get.lazyPut(() => PlaceRepository());
    Get.lazyPut<PlaceController>(
      () => PlaceController(),
    );
  }
}
