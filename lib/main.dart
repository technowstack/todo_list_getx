// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_list_getx/routes/page_route.dart';
import 'package:todo_list_getx/shared/theme.dart';
import 'package:todo_list_getx/ui/home_screen.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        getPages: AppPage.pages,
        theme: ThemeData.dark()
            .copyWith(scaffoldBackgroundColor: kBackgroundColor));
  }
}
