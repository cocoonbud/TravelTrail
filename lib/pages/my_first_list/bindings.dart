import 'package:get/get.dart';

import 'controller.dart';

class CategoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyFirstListController>(() => MyFirstListController());
  }
}
