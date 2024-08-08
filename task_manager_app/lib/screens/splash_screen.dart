// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:task_manager_app/utils/constant_colors.dart';
import 'package:task_manager_app/utils/text_style.dart';
import '../widget/text_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true); // Repeat animation

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColor.purpleColor,
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: textWidget(
              title: 'Welcome to My App!',
              style: ConstantTextStyle.splaceTextStyle
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
