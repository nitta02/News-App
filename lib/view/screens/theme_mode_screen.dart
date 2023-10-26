import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_news_app/controller/news_controller.dart';

class ThemeModeScree extends StatelessWidget {
  ThemeModeScree({super.key});
  final themeModeController = Get.put(NewsAppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('THEME MODE'),
      ),
      body: SafeArea(
          child: Column(
        children: [
          ListTile(
            leading: IconButton(
              onPressed: () {
                themeModeController.themeMode();
              },
              icon: const Icon(CupertinoIcons.moon_circle),
            ),
            title: const Text('Light Mode'),
          ),
          ListTile(
            leading: IconButton(
              onPressed: () {
                themeModeController.themeMode();
              },
              icon: const Icon(CupertinoIcons.moon_circle_fill),
            ),
            title: const Text('Dark Mode'),
          ),
        ],
      )),
    );
  }
}
