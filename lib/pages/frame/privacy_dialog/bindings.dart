import 'package:get/get.dart';

import 'controller.dart';

class PricacyDialogBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PricacyDialogController>(() => PricacyDialogController());
  }
}
