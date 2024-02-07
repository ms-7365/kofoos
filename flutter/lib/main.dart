import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kofoos/src/root/root.dart';
import 'package:kofoos/src/root/root_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KOFOOS',
      initialBinding: BindingsBuilder(() {
        Get.put(RootController());
      }),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Root(),
    );
  }
}
