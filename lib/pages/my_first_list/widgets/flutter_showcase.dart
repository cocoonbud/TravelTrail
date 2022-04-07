import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trave_trall/common/widgets/group_list.dart';

import '../../../common/style/color.dart';
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
              sliver: ListViewGroupHandler(
                numberOfSections: controller.state.showcaseList.length,
                numberOfRowsInSection: (section) =>
                    controller.state.showcaseList[section].item.length,
                cellForRowAtIndexPath: (indexPath) => flutterShowcaseCell(
                    controller.state.showcaseList[indexPath.section]
                        .item[indexPath.row]),
                headerInSection: (section) => Container(
                  height: 50,
                  color: Colors.red,
                  margin: EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'header ${section + 1}',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColor.primaryText,
                        ),
                      ),
                    ],
                  ),
                ),
                overallHeader: () => Text('overallHeader'),
                overallFooter: () => Text('overallFooter'),
                footerInSection: (section) => Text('each item footer'),
                placeholder: () {
                  return Center(
                    child: Text("啥也没得"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
