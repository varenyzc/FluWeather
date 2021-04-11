import 'package:flutter/material.dart';
import 'package:fluweather/app/data/theme/app_theme.dart';
import 'package:fluweather/app/modules/place/widgets/text_field_container.dart';

class RoundedInputField extends StatelessWidget implements PreferredSizeWidget {

  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon,
    this.onChanged
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
            icon: Icon(icon, color: kPrimaryColor),
            hintText: hintText,
            border: InputBorder.none
        ),
      ),
    );
  }

  @override
  Size get preferredSize {

  }
}