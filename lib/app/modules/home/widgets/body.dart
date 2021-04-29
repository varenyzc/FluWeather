import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluweather/app/data/models/daily_model.dart';
import 'package:fluweather/app/data/models/place_model.dart';
import 'package:fluweather/app/data/models/realtime_model.dart';
import 'package:fluweather/app/data/models/sky.dart';
import 'package:fluweather/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../../../../r.dart';

// ignore: must_be_immutable
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
                    _buildForecast(),
                    _buildLifeIndex(),
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
            _realtimeResponse.value == null ? "11℃" :
            "${_realtimeResponse.value.result.realtime.temperature.toInt().toString()} ℃",
            style: TextStyle(
                fontSize: 70,
                color: Colors.white
            ),
          ),
          Text(
            _realtimeResponse.value == null ? "晴  |  空气指数 24" :
            "${getSky(_realtimeResponse.value.result.realtime.skycon).info}  |  空气指数 ${_realtimeResponse.value.result.realtime.airQuality.aqi.chn.toInt().toString()}",
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
    return _buildCard("预报", _buildForecastList());
  }

  Widget _buildForecastList() {
    return Obx(() {
      if(_dailyResponse.value != null) {
        if(_dailyResponse.value.result.daily.temperature.length > 0) {
          return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: _dailyResponse.value.result.daily.temperature.length,
              itemBuilder: (context, index) {
                return _buildForecastItem(index);
              },
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics()
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

  Widget _buildLifeIndex() {
    return Padding(
      child: _buildCard("生活指数", _buildLifeIndexGrid()),
      padding: EdgeInsets.only(bottom: 15),
    );
  }

  Widget _buildLifeIndexGrid() {
    return Obx(() {
      if(_dailyResponse.value != null) {
        if(_dailyResponse.value.result.daily.lifeIndex != null) {
          var lifeIndex = _dailyResponse.value.result.daily.lifeIndex;
          return GridView.count(
              padding: EdgeInsets.zero,
              crossAxisCount: 2,
              childAspectRatio: 2.5,
              children: [
                _buildLifeIndexItem(R.assetsImagesIcColdrisk, "感冒", lifeIndex.coldRisk[0].desc),
                _buildLifeIndexItem(R.assetsImagesIcDressing, "穿衣", lifeIndex.dressing[0].desc),
                _buildLifeIndexItem(R.assetsImagesIcUltraviolet, "实时紫外线", lifeIndex.ultraviolet[0].desc),
                _buildLifeIndexItem(R.assetsImagesIcCarwashing, "洗车", lifeIndex.carWashing[0].desc),
              ],
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics()
          );
        }
      }

      return Text("");
    });
  }

  Widget _buildLifeIndexItem(String icon, String title, String info) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 30, right: 20),
          child: Image(
            image: AssetImage(icon),
            width: 40,
            height: 40,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 12
              ),
            ),
            Text(
              info,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _buildCard(String title, Widget child) {
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
                padding: EdgeInsets.only(top: 20, left: 15, bottom: 15),
                child: Text(
                  title,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),
                ),
              ),
              child
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
}
