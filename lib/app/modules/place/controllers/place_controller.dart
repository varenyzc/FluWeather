import 'package:fluweather/app/data/models/place_model.dart';
import 'package:fluweather/app/data/repositories/place_repository.dart';
import 'package:get/get.dart';

class PlaceController extends GetxController {

  final PlaceRepository repository = Get.find<PlaceRepository>();
  String _query;
  var place = List<Places>().obs;

  void onQueryChanged(String query) async {
    this._query = query;
    await submit();
  }

  submit() async {
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
