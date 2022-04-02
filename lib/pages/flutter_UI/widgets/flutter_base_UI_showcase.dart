import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trave_trall/common/values/values.dart';

import '../index.dart';

/// hello
class FlutterBaseUIShowcaseWidget extends GetView<FlutterUiController> {
  const FlutterBaseUIShowcaseWidget({Key? key}) : super(key: key);

  static String titleStr = 'base UI showcase';
  static double margin = 20;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        // alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              titleStr,
              style: TextStyle(
                color: AppColor.primaryText,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: margin),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  titleStr,
                  style: TextStyle(
                    color: AppColor.primaryText,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  titleStr,
                  style: TextStyle(
                    color: AppColor.primaryText,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: margin),
            RichText(
                text: TextSpan(
                    style:
                        TextStyle(color: AppColor.secondaryText, fontSize: 16),
                    children: [
                  TextSpan(text: "showcase "),
                  TextSpan(
                      text: " showcase ",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          Get.defaultDialog(
                              onConfirm: () => print("Ok"),
                              middleText: "sth clicked");
                        },
                      style: TextStyle(color: AppColor.linkBlueColor)),
                  TextSpan(text: "和"),
                  TextSpan(
                      text: " showcase",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          Get.defaultDialog(
                              onConfirm: () => print("Ok"),
                              middleText: "sth clicked");
                        },
                      style: TextStyle(color: AppColor.btnOrangeColor)),
                ])),
            SizedBox(width: 0, height: margin),
            Container(
              width: 64.0,
              height: 64.0,
              decoration: BoxDecoration(
                color: AppColor.linkBlueColor,
                image: DecorationImage(
                    image: AssetImage("assets/images/icons-twitter.png"),
                    fit: BoxFit.cover),
                shape: BoxShape.rectangle, // <-- 这里需要设置为 rectangle
                borderRadius: BorderRadius.all(
                  const Radius.circular(5), // <-- rectangle 时，BorderRadius 才有效
                ),
              ),
            ),
            SizedBox(width: 0, height: margin),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 64,
                  width: 64,
                  decoration: BoxDecoration(
                    color: AppColor.linkBlueColor.withAlpha(20),
                    boxShadow: [
                      Shadows.primaryShadow,
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                  ),
                  child: Container(),
                ),
                Image.asset("assets/images/icons-twitter.png",
                    fit: BoxFit.cover)
              ],
            ),
            SizedBox(width: 0, height: margin),
            TextButton(
              onPressed: () {
                Get.defaultDialog(
                    onConfirm: () => print("Ok"), middleText: "sth clicked");
              },
              child: Text(
                "this is a test button",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColor.secondaryText,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  height: 1, // 设置下行高，否则字体下沉
                ),
              ),
            ),
            SizedBox(width: 0, height: margin),
            ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(22)),
                    ),
                    elevation: 0,
                    primary: AppColor.linkBlueColor),
                icon: Icon(Icons.pedal_bike),
                label: Text(
                  "this is ElevatedButton.icon",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: AppColor.whiteColor),
                )),
            SizedBox(width: 0, height: margin),
            ElevatedButton(
              onPressed: () {
                Get.defaultDialog(
                    onConfirm: () => print("Ok"), middleText: "sth clicked");
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(22)),
                  ),
                  elevation: 0,
                  primary: AppColor.btnOrangeColor),
              child: Text(
                "this is a ElevatedButton",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: AppColor.whiteColor),
              ),
            ),
            SizedBox(width: 0, height: margin),
            Container(
              height: 44,
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                color: AppColor.secondBackground,
                borderRadius: BorderRadius.all(Radius.circular(22)),
              ),
              child: TextField(
                autofocus: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "please enter your bank card password",
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 9),
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  color: AppColor.primaryText,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                maxLines: 1,
                autocorrect: false,
                obscureText: false,
              ),
            ),
            SizedBox(width: 0, height: margin),
            ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  leading: Icon(Icons.access_alarm),
                  title: Text("access_alarm"),
                ),
                ListTile(
                  leading: Icon(Icons.accessible_forward),
                  title: Text("accessible_forward"),
                ),
                ListTile(
                  leading: Icon(Icons.access_time),
                  title: Text("access_time"),
                ),
                ListTile(
                  leading: Icon(Icons.arrow_circle_up_sharp),
                  title: Text("arrow_circle_up_sharp"),
                ),
                ListTile(
                  leading: Icon(Icons.playlist_add_check_outlined),
                  title: Text("playlist_add_check_outlined"),
                ),
                ListTile(
                  leading: Icon(Icons.playlist_add_circle),
                  title: Text("playlist_add_circle"),
                )
              ],
            ),
            SizedBox(width: 0, height: margin),
            Container(
              height: 44,
              width: 100,
              child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                items: [
                  DropdownMenuItem(
                    child: Text('同意'),
                    value: '同意',
                  ),
                  DropdownMenuItem(
                    child: Text('拒绝'),
                    value: '拒绝',
                  ),
                  DropdownMenuItem(
                    child: Text('再说吧'),
                    value: '再说吧',
                  )
                ],
                hint: Text('请选择'),
                onChanged: (value) {},
                isExpanded: true,
                style: TextStyle(
                  color: AppColor.primaryText,
                  fontSize: 12,
                ),
                iconSize: 30.0,
              )),
            ),
            SizedBox(width: 0, height: margin),
            FloatingActionButton(child: Text('try'), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
