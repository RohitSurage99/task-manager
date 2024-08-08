// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class ElegantTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final validator;

  const ElegantTextField({
    Key? key,
    required this.controller,
    this.hintText = 'Enter text',
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey.shade500,
          fontSize: 16.0,
        ),
        filled: true,
        fillColor: Colors.transparent,
        contentPadding:  EdgeInsets.symmetric(horizontal: screenSize.width/30.0, vertical: screenSize.height/80.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.blueGrey.shade600,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
        ),
        // prefixIcon: Icon(
        //   Icons.edit,
        //   color: Colors.blueGrey.shade600,
        // ),
        // suffixIcon: Icon(
        //   Icons.clear,
        //   color: Colors.grey.shade600,
        // ),
      ),
      cursorColor: Colors.blueGrey.shade600,
      style: const TextStyle(fontSize: 16.0),
    );
  }
}
