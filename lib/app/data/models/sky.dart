import '../../../r.dart';

class Sky {
  String info;

  String icon;

  String bg;

  Sky(String info, String icon, String bg) {
    this.info = info;
    this.icon = icon;
    this.bg = bg;
  }
}

var sky = {
  "CLEAR_DAY": Sky("晴", R.assetsImagesIcClearDay, R.assetsImagesBgClearDay),
  "CLEAR_NIGHT": Sky("晴", R.assetsImagesIcClearNight, R.assetsImagesBgClearNight),
  "PARTLY_CLOUDY_DAY": Sky("多云", R.assetsImagesIcPartlyCloudDay, R.assetsImagesBgPartlyCloudyDay),
  "PARTLY_CLOUDY_NIGHT": Sky("多云", R.assetsImagesIcPartlyCloudNight, R.assetsImagesBgPartlyCloudyNight),
  "CLOUDY": Sky("阴", R.assetsImagesIcCloudy, R.assetsImagesBgCloudy),
  "WIND": Sky("大风", R.assetsImagesIcCloudy, R.assetsImagesBgWind),
  "LIGHT_RAIN": Sky("小雨", R.assetsImagesIcLightRain, R.assetsImagesBgRain),
  "MODERATE_RAIN": Sky("中雨", R.assetsImagesIcModerateRain, R.assetsImagesBgRain),
  "HEAVY_RAIN": Sky("大雨", R.assetsImagesIcHeavyRain, R.assetsImagesBgRain),
  "STORM_RAIN": Sky("暴雨", R.assetsImagesIcStormRain, R.assetsImagesBgRain),
  "THUNDER_SHOWER": Sky("雷阵雨", R.assetsImagesIcThunderShower, R.assetsImagesBgRain),
  "SLEET": Sky("雨夹雪", R.assetsImagesIcSleet, R.assetsImagesBgRain),
  "LIGHT_SNOW": Sky("小雪", R.assetsImagesIcLightSnow, R.assetsImagesBgSnow),
  "MODERATE_SNOW": Sky("中雪", R.assetsImagesIcModerateSnow, R.assetsImagesBgSnow),
  "HEAVY_SNOW": Sky("大雪", R.assetsImagesIcHeavySnow, R.assetsImagesBgSnow),
  "STORM_SNOW": Sky("暴雪", R.assetsImagesIcHeavySnow, R.assetsImagesBgSnow),
  "HAIL": Sky("冰雹", R.assetsImagesIcHail, R.assetsImagesBgSnow),
  "LIGHT_HAZE": Sky("轻度雾霾", R.assetsImagesIcLightHaze, R.assetsImagesBgFog),
  "MODERATE_HAZE": Sky("中度雾霾", R.assetsImagesIcModerateHaze, R.assetsImagesBgFog),
  "HEAVY_HAZE": Sky("重度雾霾", R.assetsImagesIcHeavyHaze, R.assetsImagesBgFog),
  "FOG": Sky("雾", R.assetsImagesIcFog, R.assetsImagesBgFog),
  "DUST": Sky("浮尘", R.assetsImagesIcFog, R.assetsImagesBgRain),
};

Sky getSky(String skycon) {
  if(sky[skycon] == null) {
    return sky["CLEAR_DAY"];
  }
  return sky[skycon];
}