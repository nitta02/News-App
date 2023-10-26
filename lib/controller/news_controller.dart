import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NewsAppController extends GetxController {
  final box = GetStorage();

  //THEME MODE CHANGE FUNCTION
  void themeMode() {
    String? theme = box.read('theme');
    if (theme == null || theme == 'dark') {
      Get.changeThemeMode(ThemeMode.light);
      box.write('theme', 'light');
    } else {
      Get.changeThemeMode(ThemeMode.dark);
      box.write('theme', 'dark');
    }
    update();
  }

  //THEME MODE ICON CHANGE FUNCTION
  IconData iconthemeData() {
    String? theme = box.read('theme');
    if (theme == 'dark') {
      return CupertinoIcons.moon_circle_fill;
    } else {
      return CupertinoIcons.moon_circle;
    }
  }

  //BOTTOM NAVIGATION FUNCTION
  int index = 0;
  void bottomNavFunc({
    required int currentIndex,
  }) {
    index = currentIndex;
    update();
  }
}
