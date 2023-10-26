import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_news_app/view/screens/theme_mode_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            child: CircleAvatar(
              minRadius: 70,
            ),
          ),
          ListTile(
            onTap: () {
              Get.to(() => ThemeModeScree());
            },
            title: const Text('Theme Mode'),
            leading: const Icon(
              Icons.light_mode_sharp,
            ),
          ),
        ],
      ),
    );
  }
}
