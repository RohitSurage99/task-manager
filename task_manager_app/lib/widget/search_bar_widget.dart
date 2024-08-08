import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_app/utils/constant_colors.dart';
import 'package:task_manager_app/utils/text_style.dart';
import 'package:task_manager_app/widget/text_widget.dart';

Widget searchBarWidget ({title,style,onSearch,iconColor}) => EasySearchBar(

  title: Center(child: textWidget(title: title ?? '',style: style ?? ConstantTextStyle.appBarTitleTextStyle)),
  onSearch:onSearch,
  elevation: 0.0,
  // backgroundColor: Colors.transparent,
  iconTheme: IconThemeData(
    color: iconColor ?? ConstantColor.whiteColor,
  ),
);