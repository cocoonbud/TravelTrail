import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trave_trall/pages/my_first_list/widgets/flutter_showcase.dart';

import 'index.dart';

class MyFirstListPage extends GetView<MyFirstListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterShowcase(),
    );
  }
}
