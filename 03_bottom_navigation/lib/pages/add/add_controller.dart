import 'package:get/get.dart';

class AddController extends GetxController {
  var counter = 0.obs;

  void increaseCounter() {
    counter.value++;
  }
}
