import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_news_app/controller/news_controller.dart';
import 'package:getx_news_app/view/widgets/home_page_screen.dart';
import 'package:getx_news_app/view/widgets/category_page.dart';
import 'package:getx_news_app/view/widgets/custom_drawer.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final controller = Get.put(NewsAppController());
  final pageConroller = PageController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await Get.dialog(AlertDialog(
          title: const Text('Close the App'),
          content: const Text('Are You Sure?'),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Get.back(
                  result: true,
                );
              },
              child: const Text('Sure'),
            ),
          ],
        ));
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('HOME'),
          actions: [
            IconButton(
              onPressed: () {
                controller.themeMode();
              },
              icon: Icon(
                controller.iconthemeData(),
              ),
            )
          ],
        ),
        drawer: const CustomDrawer(),
        body: PageView(
          controller: pageConroller,
          onPageChanged: (value) {
            controller.bottomNavFunc(currentIndex: value);
          },
          children: const [
            HomePageScreen(),
            CategoryPage(),
          ],
        ),
        bottomNavigationBar: GetBuilder<NewsAppController>(
          builder: (controller) {
            return SalomonBottomBar(
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              currentIndex: controller.index,
              onTap: (p0) {
                controller.bottomNavFunc(currentIndex: p0);
                pageConroller.jumpToPage(p0);
              },
              items: [
                SalomonBottomBarItem(
                  icon: const Icon(CupertinoIcons.home),
                  title: const Text(
                    'HOME',
                  ),
                  unselectedColor: Colors.blue,
                  selectedColor: Colors.black,
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.category_outlined),
                  title: const Text(
                    'CATEGORY',
                  ),
                  unselectedColor: Colors.blue,
                  selectedColor: Colors.black,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
