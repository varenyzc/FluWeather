import 'dart:io';

import 'package:fluweather/app/data/constants.dart';
import 'package:fluweather/app/data/remote/dio_config.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DioConfigController extends GetxService {
  Future<DioConfig> init() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String cookiesPath = join(appDocDir.path, ".cookies/");
    DioConfig dioConfig = DioConfig();
    dioConfig.init(BASE_URL, proxy: PROXY_HOST, cookiesPath: cookiesPath);
    return dioConfig;
  }
}