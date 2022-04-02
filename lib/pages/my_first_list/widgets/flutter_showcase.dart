import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../index.dart';
import 'widgets.dart';

class FlutterShowcase extends StatefulWidget {
  FlutterShowcase({Key? key}) : super(key: key);

  @override
  _FlutterShowcaseState createState() => _FlutterShowcaseState();
}

class _FlutterShowcaseState extends State<FlutterShowcase>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final controller = Get.find<MyFirstListController>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetX<MyFirstListController>(
      init: controller,
      builder: (controller) => SmartRefresher(
        enablePullUp: true,
        controller: controller.refreshController,
        onRefresh: controller.onRefresh,
        onLoading: controller.onLoading,
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(
                vertical: 0.w,
                horizontal: 0.w,
              ),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (content, index) => GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      controller.handleCellClicked(index);
                    },
                    child: flutterShowcaseCell(
                        controller.state.showcaseList[index]),
                  ),
                  childCount: controller.state.showcaseList.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
