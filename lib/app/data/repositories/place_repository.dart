import 'package:fluweather/app/data/api/place_api.dart';
import 'package:fluweather/app/data/models/place_model.dart';
import 'package:get/get.dart';

class PlaceRepository {
  final PlaceApi api = Get.find<PlaceApi>();

  Future<Place> getPlace(String query) {
    return api.getPlace(query);
  }
}