import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluweather/app/data/models/daily_model.dart';
import 'package:fluweather/app/data/models/place_model.dart';
import 'package:fluweather/app/data/models/realtime_model.dart';
import 'package:fluweather/app/data/models/sky.dart';
import 'package:fluweather/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../../../../r.dart';

class Body extends GetView<HomeController> {
  
  var _place = Places().obs;
  var _dailyResponse = DailyResponse().obs;
  var _realtimeResponse = RealtimeResponse().obs;
  
  @override
  Widget build(BuildContext context) {
    _place = controller.place;
    _dailyResponse = controller.dailyResponse;
    _realtimeResponse = controller.realtimeResponse;
    return Scaffold(
        body: RefreshIndicator(
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.zero,
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    _buildNow(),
                    _buildForecast()
                  ]),
                ),
              )
            ],
      ),
      onRefresh: () => controller.refresh(),
    ));
  }

  Widget _buildNow() {
    return Obx(() => Container(
      height: 540,
      alignment: Alignment.topCenter,
      child: Stack(
        children: [
          _buildToolbar(),
          _buildCurTemp()
        ],
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              _realtimeResponse == null ?
              R.assetsImagesBgCloudy :
              getSky(_realtimeResponse.value.result.realtime.skycon).bg
          ),
          fit: BoxFit.fitWidth,
        ),
      ),
    ));
  }

  Widget _buildToolbar() {
    var paddingTop = MediaQueryData.fromWindow(window).padding.top;
    return Padding(
      child: Container(
        height: kToolbarHeight,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          textDirection: TextDirection.ltr,
          verticalDirection: VerticalDirection.down,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  child: Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 22,
                  ),
                  onTap: () => controller.goToPlaceView(),
                ),
                margin: EdgeInsets.only(left: 15),
              ),
              flex: 1,
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  _place.value.name == null ? "北京" : _place.value.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22
                  ),
                ),
              ),
              flex: 2,
            ),
            Expanded(
              child: Text(""),
              flex: 1,
            )
          ],
        ),
      ),
      padding: EdgeInsets.only(top: paddingTop),
    );
  }

  Widget _buildCurTemp() {
    return Container(
      height: 540,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _realtimeResponse.value == null ? "11℃" : "${_realtimeResponse.value.result.realtime.temperature.toInt().toString()} ℃",
            style: TextStyle(
                fontSize: 70,
                color: Colors.white
            ),
          ),
          Text(
            _realtimeResponse.value == null ? "晴  |  空气指数24" : "${getSky(_realtimeResponse.value.result.realtime.skycon).info}  |  空气指数 ${_realtimeResponse.value.result.realtime.airQuality.aqi.chn.toInt().toString()}",
            style: TextStyle(
                fontSize: 18,
                color: Colors.white
            ),
          )
        ],
      ),
    );
  }

  Widget _buildForecast() {
    return Padding(
        padding: EdgeInsets.only(left: 15, right: 15, top: 15),
        child: Container(
          child: Card(
            elevation: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 15),
                  child: Text(
                    "预报",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black
                    ),
                  ),
                ),
                _buildForecastList()
              ],
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.white,
          ),
        ),
    );
  }

  Widget _buildForecastList() {
    return Obx(() {
      if(_dailyResponse.value != null) {
        if(_dailyResponse.value.result.daily.temperature.length > 0) {
          return ListView.builder(
              itemCount: _dailyResponse.value.result.daily.temperature.length,
              itemBuilder: (context, index) {
                return _buildForecastItem(index);
              },
              shrinkWrap: true,
          );
        }
      }
      return Text("");
    });
  }

  Widget _buildForecastItem(int index) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              child: Text(
                _dailyResponse.value.result.daily.skycon[index].date.split("T")[0],
                textAlign: TextAlign.start,
              ),
              alignment: Alignment.centerLeft,
            ),
            flex: 4,
          ),
          Expanded(
            child: Container(
              child: Image(
                image: AssetImage(getSky(_dailyResponse.value.result.daily.skycon[index].value).icon),
                width: 20,
                height: 20,
              ),
              alignment: Alignment.center,
            ),
            flex: 1,
          ),
          Expanded(
            child: Container(
              child: Text(getSky(_dailyResponse.value.result.daily.skycon[index].value).info),
              alignment: Alignment.center,
            ),
            flex: 3,
          ),
          Expanded(
            child: Container(
              child: Text("${_dailyResponse.value.result.daily.temperature[index].min.toInt().toString()}℃ ~ ${_dailyResponse.value.result.daily.temperature[index].max.toInt().toString()}℃"),
              alignment: Alignment.centerRight,
            ),
            flex: 3,
          ),
        ],
      ),
    );
  }
}
