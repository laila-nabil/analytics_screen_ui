import 'package:analytics_screen_ui/core/app_colors.dart';
import 'package:analytics_screen_ui/screens/analytics_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'AnalyticsScreen',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
                primary: AppColors.violet800, secondary: AppColors.violet400)),
        home: AnalyticsScreen());
  }
}
