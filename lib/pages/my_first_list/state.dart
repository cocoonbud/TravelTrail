import 'package:trave_trall/common/entities/entities.dart';
import 'package:get/get.dart';

class MyFirstListState {
  RxList<ShowcaseEntity> showcaseList = <ShowcaseEntity>[
    ShowcaseEntity(title: 'UI', item: <ShowcaseItemEntity>[
      ShowcaseItemEntity(
          name: "一些常用控件", contentType: ShowcaseContentType.flutterUI),
      ShowcaseItemEntity(
          name: "动画", contentType: ShowcaseContentType.flutterAnimation),
    ]),
    ShowcaseEntity(title: '多线程', item: <ShowcaseItemEntity>[
      ShowcaseItemEntity(
          name: "多线程", contentType: ShowcaseContentType.flutterMultithreading),
    ]),
  ].obs;
}
