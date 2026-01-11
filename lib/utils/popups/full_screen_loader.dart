import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_store/common/widgets/loaders/animation_loader.dart';
import 'package:s_store/utils/constants/colors.dart';

class SSFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
        context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (_) => PopScope(
            canPop: false,
            child: Container(
              color: SSAppColors.primary,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  const SizedBox(height: 250),
                  SSAnimationLoaderWidget(text: text, animation: animation),
                ],
              ),
            )));
  }
  static void stopLoadingDialog(){
    Navigator.of(Get.overlayContext!).pop();
  }
}
