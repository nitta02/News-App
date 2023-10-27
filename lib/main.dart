// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_news_app/view/screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final getBox = GetStorage();

  @override
  Widget build(BuildContext context) {
    print(getBox.read('theme'));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          // backgroundColor: Colors.blueGrey[600],
          elevation: 0.0,
        ),
        fontFamily: 'Lato',
        drawerTheme: DrawerThemeData(
          backgroundColor: Colors.blueGrey[600],
          elevation: 15.0,
        ),
        // scaffoldBackgroundColor: Colors.blueGrey[600],
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      themeMode: getBox.read("theme") != 'dark' || getBox.read('theme') == null
          ? ThemeMode.light
          : ThemeMode.dark,
      home: MainScreen(),
    );
  }
}
