import 'package:fluweather/app/data/local/local_place_model_repository.dart';

class PlaceProvider {
  bool hasPlace() {
    return LocalPlaceModelRepository.getPlaceModel() != null;
  }
}