import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app_ui_challenge/pages/auth/log_in.dart';
import 'package:food_app_ui_challenge/pages/auth/registration.dart';
import 'package:food_app_ui_challenge/pages/post_auth/home.dart';
import 'package:food_app_ui_challenge/pages/setup/setup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(370, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Food UI',
            home: Setup(),
          );
        });
  }
}
