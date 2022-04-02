import 'package:flutter/material.dart';
import 'package:trave_trall/common/middlewares/middlewares.dart';
import 'package:trave_trall/pages/application/index.dart';
import 'package:trave_trall/pages/category/index.dart';
import 'package:trave_trall/pages/flutter_UI/index.dart';
import 'package:trave_trall/pages/frame/sign_in/index.dart';
import 'package:trave_trall/pages/frame/sign_up/index.dart';
import 'package:trave_trall/pages/frame/welcome/index.dart';
import 'package:get/get.dart';
import 'package:trave_trall/pages/frame/privacy_dialog/index.dart';

import 'routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  static final List<GetPage> routes = [
    // 免登陆
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => WelcomePage(),
      binding: WelcomeBinding(),
      middlewares: [
        RouteWelcomeMiddleware(priority: 1),
      ],
    ),
    GetPage(
      name: AppRoutes.SIGN_IN,
      page: () => SignInPage(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: AppRoutes.SIGN_UP,
      page: () => SignUpPage(),
      binding: SignUpBinding(),
    ),

    // 需要登录
    GetPage(
      name: AppRoutes.Application,
      page: () => ApplicationPage(),
      binding: ApplicationBinding(),
      middlewares: [
        RouteAuthMiddleware(priority: 1),
      ],
    ),

    // 分类列表
    GetPage(
      name: AppRoutes.Category,
      page: () => CategoryPage(),
      binding: CategoryBinding(),
    ),

    GetPage(
      name: AppRoutes.PrivacyDialog,
      binding: PricacyDialogBinding(),
      page: () => PrivacyDialog(),
      opaque: false,
    ),

    GetPage(
        name: AppRoutes.FlutterUI,
        binding: FlutterUiBinding(),
        page: () => FlutterUiPage())
  ];

//   name: AppRoutes.NotFound,
//   page: () => NotfoundView(),
// );

}
