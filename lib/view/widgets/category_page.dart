// ignore_for_file: empty_statements, dead_code

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_news_app/constants/category_constants.dart';
import 'package:getx_news_app/controller/news_controller.dart';
import 'package:getx_news_app/model/test_model.dart';
import 'package:getx_news_app/view/widgets/custom_page.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>
    with SingleTickerProviderStateMixin {
  late TabController? _tabController;

  final controller = Get.put(NewsAppController());

  @override
  void initState() {
    _tabController = TabController(
        length: CategoryConstants.categoryNames.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            isScrollable: true,
            tabs: CategoryConstants.categoryNames.map((e) {
              // ignore: avoid_unnecessary_containers
              return Container(
                child: Text(e),
              );
            }).toList(),
          ),
          Expanded(
              child: TabBarView(
                  controller: _tabController,
                  children: CategoryConstants.categoryNames
                      // ignore: prefer_const_constructors
                      .map((e) {
                    return FutureBuilder(
                      future: controller.newsCategory(category: e),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return CustomPages(
                              list: snapshot.data as List<ApiModel>);
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        ;
                      },
                    );
                  }).toList()))
        ],
      ),
    );
  }
}
