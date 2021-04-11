import 'package:get/get.dart';

import 'package:fluweather/app/modules/home/bindings/home_binding.dart';
import 'package:fluweather/app/modules/home/views/home_view.dart';
import 'package:fluweather/app/modules/place/bindings/place_binding.dart';
import 'package:fluweather/app/modules/place/views/place_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.PLACE;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PLACE,
      page: () => PlaceView(),
      binding: PlaceBinding(),
    ),
  ];
}
