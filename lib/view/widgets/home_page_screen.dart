import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_news_app/controller/news_controller.dart';
import 'package:getx_news_app/view/widgets/custom_page.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsAppController>(
      init: NewsAppController(),
      builder: (controller) {
        return CustomPages(
          list: controller.list,
        );
      },
    );
  }
}
