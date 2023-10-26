import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

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
          title: Text('HOME'),
        ),
      ),
    );
  }
}
