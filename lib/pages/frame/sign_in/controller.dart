import 'package:flutter/material.dart';
import 'package:trave_trall/common/apis/apis.dart';
import 'package:trave_trall/common/entities/entities.dart';
import 'package:trave_trall/common/routes/routes.dart';
import 'package:trave_trall/common/services/storage.dart';
import 'package:trave_trall/common/store/store.dart';
import 'package:trave_trall/common/utils/utils.dart';
import 'package:trave_trall/common/widgets/widgets.dart';
import 'package:get/get.dart';
import '../../../common/values/storage.dart';
import '../privacy_dialog/view.dart';
import 'index.dart';

class SignInController extends GetxController {
  final state = SignInState();

  SignInController();

  // email的控制器
  final TextEditingController emailController = TextEditingController();
  // 密码的控制器
  final TextEditingController passController = TextEditingController();

  // final MyRepository repository;
  // SignInController({@required this.repository}) : assert(repository != null);

  // 跳转 注册界面
  handleNavSignUp() {
    Get.toNamed(AppRoutes.SIGN_UP);
  }

  hanldeCheckIsNeedShowPrivacyDialog() {}

  // 忘记密码
  handleFogotPassword() {
    toastInfo(msg: 'fogot password');
  }

  // 执行登录操作
  handleSignIn() async {
    // if (!duIsEmail(_emailController.value.text)) {
    //   toastInfo(msg: '请正确输入邮件');
    //   return;
    // }
    // if (!duCheckStringLength(_passController.value.text, 6)) {
    //   toastInfo(msg: '密码不能小于6位');
    //   return;
    // }

    UserLoginRequestEntity params = UserLoginRequestEntity(
      email: emailController.value.text,
      password: duSHA256(passController.value.text),
    );

    UserLoginResponseEntity userProfile = await UserAPI.login(
      params: params,
    );
    UserStore.to.saveProfile(userProfile);

    Get.offAndToNamed(AppRoutes.Application);
  }

  @override
  void onInit() {
    super.onInit();
    emailController.text = "terecen@gmail.com";
    passController.text = "fuckoff";
  }

  @override
  void onReady() async {
    super.onReady();

    var isAgree = StorageService.to.getBool(STORAGE_AGREE_AGREEMENT);

    if (isAgree == false) {
      Get.dialog(PrivacyDialog());
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }
}
