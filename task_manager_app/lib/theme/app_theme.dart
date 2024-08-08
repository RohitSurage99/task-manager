import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_manager_app/utils/constant_colors.dart';

class AppTheme {
  static ThemeData get themeData {
    return ThemeData(
      primarySwatch: Colors.teal,
      colorScheme: ColorScheme.fromSeed(
        seedColor: ConstantColor.purpleColor,
        secondary: ConstantColor.whiteColor, // This is the new accent color
      ),
      backgroundColor: Colors.grey[100],
      scaffoldBackgroundColor: ConstantColor.whiteColor,
      appBarTheme: const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.light),
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black87),
        headline2: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
        bodyText1: TextStyle(fontSize: 16, color: Colors.black54),
        bodyText2: TextStyle(fontSize: 14, color: Colors.black54),
      ),

      //     floatingActionButtonTheme: FloatingActionButtonThemeData(
      //         backgroundColor: ConstantColor.whiteColor,
      //         shape: Border.all(color: ConstantColor.greenColor,),
      //       ),
      // cardTheme: CardTheme(
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(15),
      //   ),
      //   elevation: 1,
      // ),
      // elevatedButtonTheme: ElevatedButtonThemeData(
      //   style: ElevatedButton.styleFrom(
      //     primary: Colors.teal, // Button color
      //     onPrimary: Colors.white,
      //     padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(10),
      //     ),
      //   ),
      // ),
      // inputDecorationTheme: InputDecorationTheme(
      //   border: OutlineInputBorder(
      //     borderRadius: BorderRadius.circular(10),
      //     borderSide: const BorderSide(color: ConstantColor.tileColor),
      //   ),
      //   enabledBorder: OutlineInputBorder(
      //     borderRadius: BorderRadius.circular(10),
      //     borderSide: const BorderSide(color: ConstantColor.tileColor),
      //   ),
      //   focusedBorder: OutlineInputBorder(
      //     borderRadius: BorderRadius.circular(10),
      //     borderSide: const BorderSide(color: ConstantColor.tileColor, width: 2),
      //   ),
      //   contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      // ),
    );
  }
}
