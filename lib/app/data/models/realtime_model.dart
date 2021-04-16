class RealtimeResponse {
  String status;
  Result result;

  RealtimeResponse(
      {status,
      result});

  RealtimeResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    if (result != null) {
      data['result'] = result.toJson();
    }
    return data;
  }
}

class Result {
  Realtime realtime;

  Result({realtime});

  Result.fromJson(Map<String, dynamic> json) {
    realtime =
        json['realtime'] != null ? Realtime.fromJson(json['realtime']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (realtime != null) {
      data['realtime'] = realtime.toJson();
    }
    return data;
  }
}

class Realtime {
  double temperature;
  String skycon;
  AirQuality airQuality;

  Realtime(
      {
      temperature,
      skycon,
      airQuality});

  Realtime.fromJson(Map<String, dynamic> json) {
    temperature = json['temperature'];
    skycon = json['skycon'];
    airQuality = json['air_quality'] != null
        ? AirQuality.fromJson(json['air_quality'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['temperature'] = temperature;
    data['skycon'] = skycon;
    if (airQuality != null) {
      data['air_quality'] = airQuality.toJson();
    }
    return data;
  }
}

class AirQuality {
  Aqi aqi;

  AirQuality({aqi});

  AirQuality.fromJson(Map<String, dynamic> json) {
    aqi = json['aqi'] != null ? Aqi.fromJson(json['aqi']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (aqi != null) {
      data['aqi'] = aqi.toJson();
    }
    return data;
  }
}

class Aqi {
  double chn;

  Aqi({chn});

  Aqi.fromJson(Map<String, dynamic> json) {
    chn = json['chn'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['chn'] = chn;
    return data;
  }
}

