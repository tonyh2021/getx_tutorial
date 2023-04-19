import 'package:bottom_navigation/pages/add/add_controller.dart';
import 'package:bottom_navigation/pages/dashboard/dashboard_controller.dart';
import 'package:bottom_navigation/pages/home/home_controller.dart';
import 'package:bottom_navigation/pages/messages/messages_controller.dart';
import 'package:bottom_navigation/pages/users/users_controller.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<AddController>(() => AddController());
    Get.lazyPut<UsersController>(() => UsersController());
    Get.lazyPut<MessagesController>(() => MessagesController());
  }
}
