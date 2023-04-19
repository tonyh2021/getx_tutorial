import 'package:bottom_navigation/pages/add/add_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersPage extends StatelessWidget {
  final _c = Get.put(AddController());

  UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Users Number: ",
              style: TextStyle(fontSize: 20),
            ),
            const Divider(),
            Obx(() => Text("${_c.counter.value}")),
          ],
        ),
      ),
    );
  }
}
