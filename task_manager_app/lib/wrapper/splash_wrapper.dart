// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/splash_screen.dart';
import '../views/task_list_view.dart';

class SplashScreenWrapper extends StatefulWidget {
  const SplashScreenWrapper({super.key});

  @override
  _SplashScreenWrapperState createState() => _SplashScreenWrapperState();
}

class _SplashScreenWrapperState extends State<SplashScreenWrapper> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3)); // Adjust the delay as needed
    Get.offAll(() => const TaskListView()); // Use GetX for navigation
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
