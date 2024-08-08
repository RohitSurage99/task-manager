import 'package:flutter/material.dart';
import 'package:task_manager_app/utils/constant_colors.dart';

Widget iconButtonWidget ({onPressed,icon,iconColor}) => IconButton(
  icon: Icon(icon,color: iconColor ?? ConstantColor.blackColor,),
  onPressed: onPressed ?? (){},
);