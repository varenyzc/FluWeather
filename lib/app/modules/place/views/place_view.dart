import 'package:flutter/material.dart';
import 'package:fluweather/app/data/models/place_model.dart';
import 'package:fluweather/app/data/theme/app_theme.dart';
import 'package:fluweather/app/modules/place/widgets/rounded_input_field.dart';

import 'package:get/get.dart';

import '../controllers/place_controller.dart';

class PlaceView extends GetView<PlaceController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RoundedInputField(
          hintText: "输入城市",
          onChanged: controller.onQueryChanged,
          icon: Icons.search,
        ),
        toolbarHeight: 70,
        centerTitle: false,
      ),
      body: Obx(() => controller.place.isEmpty
          ? Center(
        child: Text("请输入城市"),
      ): ListView.builder(
          itemCount: controller.place.length,
          itemBuilder: (context, index) {
            return _buildItem(context, index);
          }
      ),)
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    Places places = controller.place[index];
    return Container(
      child: Column(
        children: [
          Text(places.name),
          Text(places.formattedAddress)
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kPrimaryLightColor
      ),
    );
  }
}
