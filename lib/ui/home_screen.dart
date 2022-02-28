// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, use_key_in_widget_constructors, unnecessary_null_comparison, prefer_is_empty

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_list_getx/ui/todo_edit.dart';
import 'package:todo_list_getx/widgets/menu.dart';
import '../controllers/todoController.dart';
import 'package:todo_list_getx/routes/route_name.dart';
import 'package:todo_list_getx/shared/theme.dart';

class HomeScreen extends StatelessWidget {
  final TodoController todoCtrl = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text('CHECKED',
                        style: whiteTextStyle1.copyWith(
                            fontSize: 45, fontWeight: black)),
                    Obx(
                      () => Text(
                        todoCtrl.todos.length > 0
                            ? 'You have ${todoCtrl.todos.length.toString()} tasks to finish!'
                            : 'You have ${todoCtrl.todos.length.toString()} tasks to finish\nNice Jobs!',
                        style: whiteTextStyle2.copyWith(
                            fontSize: 20, fontWeight: bold),
                      ),
                    ),
                    Obx(
                      () => Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) => Dismissible(
                                  key: UniqueKey(),
                                  onDismissed: (_) {
                                    var removed = todoCtrl.todos[index];
                                    todoCtrl.todos.removeAt(index);
                                    Get.snackbar(
                                      'Task Removed',
                                      'The task removed "${removed.title}" was succesfully removed.',
                                      mainButton: TextButton(
                                        onPressed: () {
                                          if (removed == null) {
                                            return;
                                          }
                                          todoCtrl.todos.insert(index, removed);
                                          removed == null;
                                          if (Get.isSnackbarOpen) {
                                            Get.back();
                                          }
                                        },
                                        child: Text('Undo'),
                                      ),
                                    );
                                  },
                                  child: ListTile(
                                    title: Text(
                                      todoCtrl.todos[index].title.toString(),
                                      style: (todoCtrl.todos[index].done)
                                          ? TextStyle(
                                              color: Colors.red,
                                              decoration:
                                                  TextDecoration.lineThrough)
                                          : whiteTextStyle2,
                                    ),
                                    subtitle: Text(
                                      DateFormat.yMMMMEEEEd()
                                          .format(
                                            DateTime.fromMillisecondsSinceEpoch(
                                              todoCtrl
                                                  .todos[index].selectedDate!
                                                  .toInt(),
                                            ),
                                          )
                                          .toString(),
                                    ),
                                    onTap: () {
                                      Get.to(TodoEdit(index: index));
                                    },
                                    leading: Checkbox(
                                      value: todoCtrl.todos[index].done,
                                      onChanged: (v) {
                                        var changed = todoCtrl.todos[index];
                                        changed.done = v!;
                                        todoCtrl.todos[index] = changed;
                                      },
                                    ),
                                    trailing: Icon(Icons.chevron_right),
                                  ),
                                ),
                            separatorBuilder: (_, __) => Divider(),
                            itemCount: todoCtrl.todos.length),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 57,
                color: kBottomColor,
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                        onPressed: () {
                          showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height: 230,
                                color: kBackgroundColor,
                                child: Column(
                                  children: [
                                    SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Menu(
                                              title: 'Contact Me',
                                              icon: Icon(Icons.person),
                                              url: 'https://taufikhdyt.com'),
                                          Menu(
                                              title: 'Support Me',
                                              icon: Icon(Icons.attach_money),
                                              url:
                                                  'https://trakteer.id/technowstack'),
                                          Container(
                                            margin: EdgeInsets.only(top: 2),
                                            child: ListTile(
                                                title: Text('Share'),
                                                leading: Icon(Icons.share),
                                                onTap: () {
                                                  Clipboard.setData(ClipboardData(
                                                      text:
                                                          "https://taufikhdyt.com"));
                                                }),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                        child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left: 15, bottom: 15),
                                        child: Text(
                                            'Vesion : 1.0.0 Copyright © Technowstack'),
                                      ),
                                    ))
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        icon: Icon(Icons.menu))),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kWhiteColor,
        onPressed: () {
          Get.toNamed(RouteName.todoPage);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
