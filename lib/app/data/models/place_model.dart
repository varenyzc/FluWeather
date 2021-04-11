class Place {
  String status;
  String query;
  List<Places> places;

  Place({status, query, places});

  Place.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    query = json['query'];
    if (json['places'] != null) {
      places = <Places>[];
      json['places'].forEach((v) {
        places.add(Places.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['query'] = query;
    if (places != null) {
      data['places'] = places.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Places {
  String id;
  String name;
  String formattedAddress;
  Location location;
  String placeId;

  Places({id, name, formattedAddress, location, placeId});

  Places.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    formattedAddress = json['formatted_address'];
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    placeId = json['place_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['formatted_address'] = formattedAddress;
    if (location != null) {
      data['location'] = location.toJson();
    }
    data['place_id'] = placeId;
    return data;
  }
}

class Location {
  num lat;
  num lng;

  Location({lat, lng});

  Location.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }
}
