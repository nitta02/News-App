import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_news_app/controller/news_helper.dart';
import 'package:getx_news_app/model/test_model.dart';

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

  //NEWS HEADLINES FROM API URL
  NewsApiHelper newsApihelper = NewsApiHelper();

  List<ApiModel> list = [];

  Future<List<ApiModel>> newsHeadlines() async {
    list = await newsApihelper.getApiData();
    // print(data); // Check the data received from the API
    // list = data;
    return list;
  }

  //NEWS CATEGORY FROM API URL
  NewsApiHelper newsApicategory = NewsApiHelper();

  List<ApiModel> categoryList = [];

  Future<List<ApiModel>> newsCategory({
    required String category,
  }) async {
    categoryList = await newsApicategory.getCategoryApiData(category: category);
    return categoryList;
  }

  @override
  void onInit() {
    newsHeadlines();
    super.onInit();
  }
}
