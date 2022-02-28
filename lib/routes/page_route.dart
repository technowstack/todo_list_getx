// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:todo_list_getx/routes/route_name.dart';
import '../ui/home_screen.dart';
import '../ui/todo_screen.dart';

class AppPage {
  static final pages = [
    GetPage(
      name: RouteName.homePage,
      page: (() => HomeScreen()),
    ),
    GetPage(
      name: RouteName.todoPage,
      page: (() => TodoScreen()),
    ),
  ];
}
