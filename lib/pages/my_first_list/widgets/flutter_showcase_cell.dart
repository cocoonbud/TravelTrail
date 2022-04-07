import 'package:flutter/material.dart';
import 'package:trave_trall/common/entities/entities.dart';
import 'package:trave_trall/common/style/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget flutterShowcaseCell(
  ShowcaseItemEntity item,
) {
  return Container(
    height: 44.h,
    padding: EdgeInsets.only(left: 20.w, right: 20.w),
    child: Column(
      children: [
        Container(
          height: 43.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                item.name,
                style: TextStyle(
                  fontSize: 18,
                  color: AppColor.primaryText,
                ),
              ),
              Spacer(),
            ],
          ),
        ),
        Spacer(),
        Divider(height: 1.h),
      ],
    ),
  );
}
