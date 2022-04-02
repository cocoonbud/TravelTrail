import 'package:trave_trall/common/services/services.dart';
import 'package:trave_trall/common/values/storage.dart';
import 'package:get/get.dart';

import 'index.dart';

class PricacyDialogController extends GetxController {
  final state = PricacyDialogState();

  PricacyDialogController();

  // 执行登录操作
  handleAgree() {
    StorageService.to.setBool(STORAGE_AGREE_AGREEMENT, true);
    Get.back();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
