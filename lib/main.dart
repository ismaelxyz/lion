import 'package:flutter/material.dart';
import 'package:lion_calculator/bindings/my_bindings.dart';
import 'package:lion_calculator/pages/home_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: MyBindings(),
      title: "Lion Calculator",
      home: HomePage(),
    );
  }
}
