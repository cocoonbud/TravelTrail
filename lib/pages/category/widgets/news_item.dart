import 'package:flutter/material.dart';
import 'package:trave_trall/common/entities/entities.dart';
import 'package:trave_trall/common/utils/utils.dart';
import 'package:trave_trall/common/style/style.dart';
import 'package:trave_trall/common/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget newsListItem(NewsItem item) {
  return Container(
    height: 161.h,
    padding: EdgeInsets.all(20.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // 图
        InkWell(
          onTap: () {
            // ExtendedNavigator.rootNavigator.pushNamed(
            //   Routes.detailsPageRoute,
            //   arguments: DetailsPageArguments(item: item),
            // );
          },
          child: netImageCached(
            item.thumbnail ?? "",
            width: 121.w,
            height: 121.w,
          ),
        ),
        // 右侧
        SizedBox(
          width: 194.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // 作者
              Container(
                margin: EdgeInsets.all(0),
                child: Text(
                  item.author ?? "",
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.normal,
                    color: AppColor.secondaryText,
                    fontSize: 14.sp,
                    height: 1,
                  ),
                ),
              ),
              // 标题
              InkWell(
                onTap: () {
                  // ExtendedNavigator.rootNavigator.pushNamed(
                  //   Routes.detailsPageRoute,
                  //   arguments: DetailsPageArguments(item: item),
                  // );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10.h),
                  child: Text(
                    item.title ?? "",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      color: AppColor.primaryText,
                      fontSize: 16.sp,
                      height: 1,
                    ),
                    overflow: TextOverflow.clip,
                    maxLines: 3,
                  ),
                ),
              ),
              // Spacer
              Spacer(),
              // 一行 3 列
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // 分类
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 60.w,
                      ),
                      child: Text(
                        item.category ?? "",
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontWeight: FontWeight.normal,
                          color: AppColor.secondaryText,
                          fontSize: 14.sp,
                          height: 1,
                        ),
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                      ),
                    ),
                    // 添加时间
                    Container(
                      width: 15.w,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 100.w,
                      ),
                      child: Text(
                        '• ${duTimeLineFormat(item.addtime ?? DateTime(0))}',
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontWeight: FontWeight.normal,
                          color: AppColor.secondaryText,
                          fontSize: 14.sp,
                          height: 1,
                        ),
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                      ),
                    ),
                    // 更多
                    Spacer(),
                    InkWell(
                      child: Icon(
                        Icons.more_horiz,
                        color: AppColor.primaryText,
                        size: 24.sp,
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
