import 'package:trave_trall/common/entities/entities.dart';
import 'package:get/get.dart';

class MyFirstListState {
  RxList<ShowcaseResponseEntity> showcaseList = <ShowcaseResponseEntity>[
    ShowcaseResponseEntity(
        name: "UI", contentType: ShowcaseContentType.flutterUI),
    ShowcaseResponseEntity(
        name: "多线程", contentType: ShowcaseContentType.flutterMultithreading),
  ].obs;
}
