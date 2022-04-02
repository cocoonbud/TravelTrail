import 'package:get/get.dart';

import 'controller.dart';

class FlutterUiBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FlutterUiController>(() => FlutterUiController());
  }
}
