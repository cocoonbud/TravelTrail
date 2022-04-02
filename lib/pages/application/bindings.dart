import 'package:trave_trall/pages/category/index.dart';
import 'package:trave_trall/pages/main/index.dart';
import 'package:get/get.dart';
import 'package:trave_trall/pages/my_first_list/index.dart';

import 'controller.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApplicationController>(() => ApplicationController());
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<CategoryController>(() => CategoryController());
    Get.lazyPut<MyFirstListController>(() => MyFirstListController());
  }
}
