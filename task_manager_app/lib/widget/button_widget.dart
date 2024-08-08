import 'package:flutter/material.dart';
import 'package:task_manager_app/utils/constant_colors.dart';
import 'package:task_manager_app/utils/text_style.dart';

Widget modernElevatedButton ({onPressed,label,textStyle,key,backgroundColor,minimumSize}) =>
    ElevatedButton(
      key: key,
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          foregroundColor: ConstantColor.whiteColor,
          backgroundColor: backgroundColor ?? ConstantColor.orangeColor, // Text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0), // Rounded corners
          ),
          elevation: 1, // Shadow effect
          minimumSize: minimumSize,
          textStyle: textStyle ?? ConstantTextStyle.buttonTextStyle
      ),
      child: Text(label,style:textStyle),
    );
