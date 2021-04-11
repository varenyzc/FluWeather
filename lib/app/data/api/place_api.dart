import 'package:fluweather/app/data/constants.dart';
import 'package:fluweather/app/data/models/place_model.dart';
import 'package:fluweather/app/data/remote/app_response.dart';
import 'package:fluweather/app/data/remote/dio_client.dart';
import 'package:get/get.dart';

class PlaceApi {

  final String _place = "/v2/place";
  final DioClient _dio = Get.find<DioClient>();

  Future<Place> getPlace(String query) async {
    AppResponse appResponse = await _dio.get(_place, queryParameters: {
      "query": query,
      "token": TOKEN,
      "lang": "zh_CN"
    });
    if(appResponse.ok) {
      return Place.fromJson(appResponse.data);
    } else {
      throw appResponse.error;
    }
  }
}