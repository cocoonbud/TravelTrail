import 'package:flutter/material.dart';
import 'package:trave_trall/common/routes/routes.dart';
import 'package:trave_trall/common/services/storage.dart';
import 'package:trave_trall/common/store/store.dart';

import 'package:get/get.dart';

import '../values/storage.dart';

/// 第一次欢迎页面
class RouteWelcomeMiddleware extends GetMiddleware {
  // priority 数字小优先级高
  @override
  int? priority = 0;

  RouteWelcomeMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    StorageService.to.setBool(STORAGE_DEVICE_FIRST_OPEN_KEY, true);

    if (ConfigStore.to.isFirstOpen == true) {
      return null;
    } else if (UserStore.to.isLogin == true) {
      return RouteSettings(name: AppRoutes.Application);
    } else {
      return RouteSettings(name: AppRoutes.SIGN_IN);
    }
  }
}

// /// 第一次欢迎页面
// class RoutePrivacyMiddleware extends GetMiddleware {
//   @override
//   int? priority = 0;

//   RoutePrivacyMiddleware({required this.priority});

//   // var isAgree = StorageService.to.getBool(STORAGE_AGREE_AGREEMENT);

//   //doing by cocoon isArgree = false test
//   var isAgree = false;



//   @override
//   RouteSettings? redirect(String? route) {
//     if (isAgree == false) {
//       return RouteSettings(name: AppRoutes.PrivacyDialog);
//     } else {
//       return null;
//     }
//   }
// }
