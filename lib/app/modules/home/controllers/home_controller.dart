import 'package:fluweather/app/data/local/local_place_model_repository.dart';
import 'package:fluweather/app/data/models/daily_model.dart';
import 'package:fluweather/app/data/models/place_model.dart';
import 'package:fluweather/app/data/models/realtime_model.dart';
import 'package:fluweather/app/data/repositories/weather_repository.dart';
import 'package:fluweather/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  final WeatherRepository repository = Get.find<WeatherRepository>();
  var place = Places().obs;

  var dailyResponse = DailyResponse().obs;
  var realtimeResponse = RealtimeResponse().obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async{
    super.onReady();
    refresh();
  }

  @override
  void onClose() {}

  Future<void> refresh() async {
    var placeModel = LocalPlaceModelRepository.getPlaceModel();
    if(placeModel != null) {
      place.value = placeModel;
    }

    if(place.value.location != null) {
      String lng = place.value.location.lng.toString();
      String lat = place.value.location.lat.toString();

      DailyResponse dailyResponse = await repository.getDailyWeather(lng, lat);
      RealtimeResponse realtimeResponse = await repository.getRealtimeWeather(lng, lat);

      this.dailyResponse.value = dailyResponse;
      this.realtimeResponse.value = realtimeResponse;
    }
    return;
  }

  void goToPlaceView() async {
    var needRefresh = await Get.toNamed(Routes.PLACE, arguments: true);
    print("needRefresh:"+needRefresh.toString());
    if(needRefresh != null && needRefresh) {
      refresh();
    }
  }
}
