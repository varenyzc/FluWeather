import 'package:fluweather/app/data/local/local_place_model_repository.dart';
import 'package:fluweather/app/data/models/place_model.dart';
import 'package:fluweather/app/data/providers/place_provider.dart';
import 'package:fluweather/app/data/repositories/place_repository.dart';
import 'package:fluweather/app/routes/app_pages.dart';
import 'package:get/get.dart';

class PlaceController extends GetxController {

  final PlaceRepository repository = Get.find<PlaceRepository>();
  bool fromHome = false;
  String _query;
  var place = List<Places>().obs;

  void onQueryChanged(String query) async {
    this._query = query;
    await queryPlace();
  }

  void savePlace(Places places) {
    LocalPlaceModelRepository.savePlaceModel(places);
    if(fromHome) {
      print("fromHome");
      Get.back(result: true);
    } else {
      Get.offNamed(Routes.HOME);
    }
  }

  @override
  void onReady() {
    super.onReady();
    if(Get.arguments != null) {
      fromHome = Get.arguments;
    }

    PlaceProvider placeProvider = Get.find<PlaceProvider>();

    if(fromHome) {
      return;
    }

    if(placeProvider.hasPlace()) {
      Get.offNamed(Routes.HOME);
    }
  }

  queryPlace() async {
      if(_query == null || _query.trim().toString().isEmpty) {
        this.place.clear();
        return;
      }

      try {
        Place place = await repository.getPlace(_query);
        print("data: " + place.toJson().toString());
        if(_query == null || _query.trim().toString().isEmpty) {
          this.place.clear();
          return;
        }
        this.place.clear();
        this.place.addAll(place.places);
      } catch(e) {
        this.place.clear();
        print("error: " + e.toString());
      }
  }
}
