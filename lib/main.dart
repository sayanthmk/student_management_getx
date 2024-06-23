import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_student_management_app/homepage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'item.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ItemAdapter());
  await Hive.openBox<Item>('items');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
