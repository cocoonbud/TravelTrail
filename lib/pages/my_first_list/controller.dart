import 'package:trave_trall/common/entities/showcase.dart';
import 'package:trave_trall/common/widgets/markdown_display.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../common/routes/names.dart';
import 'index.dart';

class MyFirstListController extends GetxController {
  MyFirstListController();

  _initData() {
    update(["my_first_list"]);
  }

  /// 响应式成员变量
  final state = MyFirstListState();

  /// UI 组件
  final RefreshController refreshController = RefreshController(
    initialRefresh: true,
  );

  void onRefresh() {
    refreshController.refreshCompleted();
  }

  void handleCellClicked(int idx) {
    ShowcaseResponseEntity model;

    if (idx < state.showcaseList.length) {
      model = state.showcaseList[idx];

      switch (model.contentType) {
        case ShowcaseContentType.flutterUI:
          {
            Get.toNamed(AppRoutes.FlutterUI);
          }
          break;
        case ShowcaseContentType.flutterMultithreading:
          {
            Get.to(MarkdownDisplay(
              titleStr: model.name,
              dataURLStr:
                  'assets/markdown/indepth_understand_flutter_multithreading.md',
            ));
          }
          break;
      }
    }
  }

  void onLoading() {
    refreshController.refreshCompleted();
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  @override
  void dispose() {
    super.dispose();
    refreshController.dispose();
  }
}
