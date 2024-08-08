import 'package:flutter/material.dart';
import 'package:task_manager_app/utils/constant_colors.dart';

Widget checkBoxWidget ({value,onChanged }){
return Checkbox(
  value: value,
  onChanged: onChanged,
  activeColor: ConstantColor.tileColor,
  checkColor: ConstantColor.whiteColor,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(5.0),
  ),
);
}