
import 'package:flutter/material.dart';
import '../utils/constant_colors.dart';

class YesNoPermissionDialog {
  static Future<bool> showExitConfirmationDialog({
    required BuildContext context,
    required String title,
    required String content,
    required List<Widget> actions,
  }) async {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return await showDialog(
      // barrierColor: Colors.transparent,
      context: context,
      builder: (context) => AlertDialog(
        iconPadding: EdgeInsets.zero,
        icon: IconButton(
          icon: const CircleAvatar(
            backgroundColor: ConstantColor.greyColor,
            radius: 25.0,
            child: Icon(
              Icons.question_mark_outlined,
              size: 30.0,
              color:ConstantColor.purpleColor,
            ),
          ),
          onPressed: () {
            // Add your onPressed functionality here
          },
        ),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
        // backgroundColor: ConstantColor.primaryBackgroundMainColor,
        title: Text(title,textAlign: TextAlign.center,),
        content: Text(content,textAlign: TextAlign.center,),
        contentPadding: EdgeInsets.symmetric(horizontal: screenWidth / 30),
        titlePadding: EdgeInsets.symmetric(horizontal: screenWidth / 30,),
        actionsAlignment: MainAxisAlignment.center,
        actionsPadding: EdgeInsets.symmetric(vertical: screenHeight /80),
        actions: actions,
      ),
    ) ??
        false;
  }
}


