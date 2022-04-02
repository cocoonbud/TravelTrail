import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class FlutterUiPage extends GetView<FlutterUiController> {
  const FlutterUiPage({Key? key}) : super(key: key);

  // 内容页
  Widget _buildView() {
    return const FlutterBaseUIShowcaseWidget();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FlutterUiController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("flutter_ui")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
