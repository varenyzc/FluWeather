class DailyResponse {
  String status;
  Result result;

  DailyResponse(
      {status,
      result});

  DailyResponse.fromJson(Map<String, dynamic> json) {
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
  Dailys daily;

  Result({daily, primary});

  Result.fromJson(Map<String, dynamic> json) {
    daily = json['daily'] != null ? Dailys.fromJson(json['daily']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (daily != null) {
      data['daily'] = daily.toJson();
    }
    return data;
  }
}

class Dailys {
  List<Temperature> temperature;
  List<Skycon> skycon;
  LifeIndex lifeIndex;

  Dailys(
      {
      temperature,
      skycon,
      lifeIndex});

  Dailys.fromJson(Map<String, dynamic> json) {
    if (json['temperature'] != null) {
      temperature = <Temperature>[];
      json['temperature'].forEach((v) {
        temperature.add(Temperature.fromJson(v));
      });
    }

    if (json['skycon'] != null) {
      skycon = <Skycon>[];
      json['skycon'].forEach((v) {
        skycon.add(Skycon.fromJson(v));
      });
    }
    lifeIndex = json['life_index'] != null
        ? LifeIndex.fromJson(json['life_index'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (temperature != null) {
      data['temperature'] = temperature.map((v) => v.toJson()).toList();
    }
    if (skycon != null) {
      data['skycon'] = skycon.map((v) => v.toJson()).toList();
    }
    if (lifeIndex != null) {
      data['life_index'] = lifeIndex.toJson();
    }
    return data;
  }
}

class Temperature {
  double max;
  double min;

  Temperature({max, min});

  Temperature.fromJson(Map<String, dynamic> json) {
    max = json['max'];
    min = json['min'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['max'] = max;
    data['min'] = min;
  }
}

class Skycon {
  String date;
  String value;

  Skycon({date, value});

  Skycon.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['date'] = date;
    data['value'] = value;
    return data;
  }
}

class LifeIndex {

  List<LifeDescription> ultraviolet;

  List<LifeDescription> carWashing;

  List<LifeDescription> dressing;

  List<LifeDescription> coldRisk;

  LifeIndex.fromJson(Map<String, dynamic> json) {
    if(json['ultraviolet'] != null) {
      ultraviolet = <LifeDescription>[];
      json['ultraviolet'].forEach((v) {
        ultraviolet.add(LifeDescription.fromJson(v));
      });
    }

    if(json['carWashing'] != null) {
      carWashing = <LifeDescription>[];
      json['carWashing'].forEach((v) {
        carWashing.add(LifeDescription.fromJson(v));
      });
    }

    if(json['dressing'] != null) {
      dressing = <LifeDescription>[];
      json['dressing'].forEach((v) {
        dressing.add(LifeDescription.fromJson(v));
      });
    }

    if(json['coldRisk'] != null) {
      coldRisk = <LifeDescription>[];
      json['coldRisk'].forEach((v) {
        coldRisk.add(LifeDescription.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic> {};
    data['ultraviolet'] = ultraviolet;
    data['carWashing'] = carWashing;
    data['dressing'] = dressing;
    data['coldRisk'] = coldRisk;
    return data;
  }

}

class LifeDescription {
  String desc;

  LifeDescription({desc});

  LifeDescription.fromJson(Map<String, dynamic> json) {
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic> {};
    data['desc'] = desc;
    return data;
  }
}