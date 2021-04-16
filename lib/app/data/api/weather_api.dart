import 'package:fluweather/app/data/constants.dart';
import 'package:fluweather/app/data/models/daily_model.dart';
import 'package:fluweather/app/data/models/realtime_model.dart';
import 'package:fluweather/app/data/remote/app_response.dart';
import 'package:fluweather/app/data/remote/dio_client.dart';
import 'package:get/get.dart';

class WeatherApi {

  final DioClient _dio = Get.find<DioClient>();

  Future<DailyResponse> getDailyWeather(String lng, String lat) async {
    final url = "/v2.5/$TOKEN/$lng,$lat/daily.json";
    AppResponse appResponse = await _dio.get(url);
    if(appResponse.ok) {
      return DailyResponse.fromJson(appResponse.data);
    } else {
      throw appResponse.error;
    }
  }

  Future<RealtimeResponse> getRealtimeWeather(String lng, String lat) async {
    final url = "/v2.5/$TOKEN/$lng,$lat/realtime.json";
    AppResponse appResponse = await _dio.get(url);
    if(appResponse.ok) {
      return RealtimeResponse.fromJson(appResponse.data);
    } else {
      throw appResponse.error;
    }
  }
}