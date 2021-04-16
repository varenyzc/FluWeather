import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluweather/app/data/models/place_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalPlaceModelRepository {

  static final String _keyPlaceModel = "key_place_model";

  static savePlaceModel(Places places)  {
    SharedPreferences sp = Get.find<SharedPreferences>();
    sp.setString(_keyPlaceModel, jsonEncode(places.toJson()));
  }

  static Places getPlaceModel() {
    SharedPreferences sp = Get.find<SharedPreferences>();
    try {
      var json = sp.getString(_keyPlaceModel);
      return Places.fromJson(jsonDecode(json));
    } catch(e) {
      debugPrint(e.toString());
      return null;
    }
  }
}