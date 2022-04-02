import 'package:flutter/material.dart';
import 'package:trave_trall/common/utils/utils.dart';
import 'package:trave_trall/common/style/style.dart';
import 'package:trave_trall/common/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../index.dart';

/// 推荐阅读
class NewsRecommendWidget extends GetView<MainController> {
  NewsRecommendWidget();

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.state.newsRecommend == null
        ? Container()
        : Container(
            margin: EdgeInsets.all(20.w),
            child: Column(
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
                    controller.state.newsRecommend.thumbnail,
                    width: 335.w,
                    height: 290.h,
                  ),
                ),
                // 作者
                Container(
                  margin: EdgeInsets.only(top: 14.h),
                  child: Text(
                    controller.state.newsRecommend.author,
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontWeight: FontWeight.normal,
                      color: AppColor.secondaryText,
                      fontSize: 14.sp,
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
                      controller.state.newsRecommend.title,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        color: AppColor.primaryText,
                        fontSize: 24.sp,
                        height: 1,
                      ),
                    ),
                  ),
                ),
                // 一行 3 列
                Container(
                  margin: EdgeInsets.only(top: 10.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // 分类
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 120,
                        ),
                        child: Text(
                          controller.state.newsRecommend.category,
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
                        constraints: const BoxConstraints(
                          maxWidth: 120,
                        ),
                        child: Text(
                          '• ${duTimeLineFormat(controller.state.newsRecommend.addtime)}',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontWeight: FontWeight.normal,
                            color: AppColor.primaryText,
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
                          size: 24,
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ));
  }
}
