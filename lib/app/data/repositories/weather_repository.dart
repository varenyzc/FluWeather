import 'package:fluweather/app/data/api/weather_api.dart';
import 'package:fluweather/app/data/models/daily_model.dart';
import 'package:fluweather/app/data/models/realtime_model.dart';
import 'package:get/get.dart';

class WeatherRepository {
  final WeatherApi api = Get.find<WeatherApi>();

  Future<DailyResponse> getDailyWeather(String lng, String lat) {
    return api.getDailyWeather(lng, lat);
  }

  Future<RealtimeResponse> getRealtimeWeather(String lng, String lat) {
    return api.getRealtimeWeather(lng, lat);
  }
}