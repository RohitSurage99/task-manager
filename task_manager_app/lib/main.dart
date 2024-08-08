import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_app/theme/app_theme.dart';
import 'package:task_manager_app/views/add_edit_task_view.dart';
import 'bindings/task_binding.dart';
import 'views/task_list_view.dart';
import 'widget/page animation widget/customTransition_widget.dart';
import 'wrapper/splash_wrapper.dart';

void main() {
  runApp (const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.themeData, // Apply the theme here
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      initialBinding: TaskBinding(),
      getPages: [
        GetPage(name: '/', page: () => const SplashScreenWrapper()),
        GetPage(name: '/add-edit-task', page: () => AddEditTaskView(), customTransition: CustomPageTransition()),
      ],
    );
  }
}
