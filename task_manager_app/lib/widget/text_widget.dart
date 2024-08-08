import 'package:flutter/material.dart';

Widget textWidget ({title,style }){
  return Text(
    title??"", style: style
  );
}