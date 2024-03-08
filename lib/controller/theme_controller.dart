import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  final switcherController = ValueNotifier<bool>(false);

  bool get isDark => !switcherController.value;

  setTheme(SystemUiOverlayStyle theme) {
    SystemChrome.setSystemUIOverlayStyle(theme);
    update();
  }

  @override
  void onInit() {
    switcherController.addListener(() {
      if (isDark) {
        setTheme(SystemUiOverlayStyle.light);
      } else {
        setTheme(SystemUiOverlayStyle.dark);
      }
    });
    super.onInit();
  }
}
