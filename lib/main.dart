import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_news_app/view/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.grey[600],
            elevation: 0.0,
          ),
          fontFamily: 'Lato'),
      home: MainScreen(),
    );
  }
}
