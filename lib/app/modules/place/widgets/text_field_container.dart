import 'package:flutter/material.dart';
import 'package:fluweather/app/data/theme/app_theme.dart';
import 'package:get/get.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  TextFieldContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: context.width,
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: child,
    );
  }
}
