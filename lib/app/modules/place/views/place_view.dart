import 'package:flutter/material.dart';
import 'package:fluweather/app/data/models/place_model.dart';
import 'package:fluweather/app/modules/place/widgets/rounded_input_field.dart';

import 'package:get/get.dart';

import '../../../../r.dart';
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
        body: Obx(
          () => controller.place.isEmpty
              ? Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(R.assetsImagesBgPlace),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: controller.place.length,
                  itemBuilder: (context, index) {
                    return _buildItem(context, index);
                  }),
        ),
      resizeToAvoidBottomInset: false,
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    Places places = controller.place[index];
    return GestureDetector(
      child: Card(
        elevation: 5,
        margin: EdgeInsets.all(12),
        child: Container(
          height: 130,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 18),
                child: Text(
                  places.name,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Text(
                  places.formattedAddress,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey
                  ),
                ),
              )

            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.white,
          ),
        ),
      ),
      onTap: () => controller.savePlace(places),
    );
  }
}
