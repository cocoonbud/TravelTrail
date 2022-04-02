import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:trave_trall/common/services/services.dart';
import 'package:trave_trall/common/values/storage.dart';
import 'package:trave_trall/common/style/style.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'index.dart';

class PrivacyDialog extends GetView<PricacyDialogController> {
  void _handleAgreeAgreement() {
    StorageService.to.setBool(STORAGE_AGREE_AGREEMENT, true);
    // controller.handleAgree();
    Get.back();
  }

  static Future<bool> requestPrivacyAgreement(BuildContext context) async {
    // doing by cocoon
    var isAgree = StorageService().getBool(STORAGE_AGREE_AGREEMENT);

    if (isAgree) {
      return isAgree;
    } else {
      Future.delayed(Duration.zero, () {
        showDialog(context: context, builder: (context) => PrivacyDialog());
      });
      return false;
    }
  }

  static openUerAgreement(BuildContext context) {}

  static openUserPrivacyPolicy(BuildContext context) {}

  static Widget bottomPrivacyAndUserAgreementView(
      BuildContext context, bool isAgree, VoidCallback handleAgree) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () => handleAgree(),
          behavior: HitTestBehavior.opaque,
          child: Container(
              padding: EdgeInsets.all(6),
              child: Image.asset(
                "assets/${isAgree ? "ic_protocol_checked" : "ic_protocol_unchecked"}.png",
                width: 14,
                height: 14,
              )),
        ),
        RichText(
            text: TextSpan(
                style: TextStyle(
                  fontSize: 12,
                  color: AppColor.primaryText.withOpacity(0.5),
                ),
                children: [
              TextSpan(
                text: "登录注册代表同意App",
              ),
              TextSpan(
                text: " 用户协议 ",
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    openUerAgreement(context);
                  },
                style: TextStyle(decoration: TextDecoration.underline),
              ),
              TextSpan(
                text: "和",
              ),
              TextSpan(
                text: " 隐私协议 ",
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    openUserPrivacyPolicy(context);
                  },
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ]))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 32, 20, 0),
        child: SingleChildScrollView(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                "用户协议及隐私政策",
                style: TextStyle(
                    color: AppColor.primaryText,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 16),
              child: Text(
                "感谢你的信任！\n依照最新的法律法规及监管政策要求，我们更新了《用户协议》与《隐私政策》。请你务必仔细阅读并透彻理解相关条款内容，在充分了解并同意后使用。我们将依照法律法规要求，采取相应安全保护措施，尽力保护你的个人信息安全。",
                style: TextStyle(color: AppColor.secondaryText, fontSize: 13),
              ),
            ),
            RichText(
                text: TextSpan(
                    style:
                        TextStyle(color: AppColor.secondaryText, fontSize: 13),
                    children: [
                  TextSpan(text: "查看完整"),
                  TextSpan(
                      text: "「隐私政策」",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          openUserPrivacyPolicy(context);
                        },
                      style: TextStyle(color: Color(0xFFEC4020))),
                  TextSpan(text: "和"),
                  TextSpan(
                      text: "「用户协议」",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          openUerAgreement(context);
                        },
                      style: TextStyle(color: Color(0xFFEC4020))),
                ])),
            Container(
              margin: EdgeInsets.only(top: 24),
              height: 40,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _handleAgreeAgreement();
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(22)),
                    ),
                    elevation: 0,
                    primary: AppColor.btnOrangeColor),
                child: Text(
                  "同意并继续",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: AppColor.whiteColor),
                ),
              ),
            ),
            Container(
              height: 40,
              width: double.infinity,
              margin: EdgeInsets.only(top: 8, bottom: 10),
              child: TextButton(
                onPressed: () {
                  exit(0);
                },
                child: Text(
                  "不同意",
                  style: TextStyle(
                    color: AppColor.secondaryText,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
