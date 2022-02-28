// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, must_be_immutable, unnecessary_null_comparison, use_key_in_widget_constructors, unused_local_variable, unnecessary_this, empty_statements, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_list_getx/models/todo.dart';
import 'package:todo_list_getx/shared/theme.dart';

import '../controllers/todoController.dart';

class TodoScreen extends StatelessWidget {
  final TodoController todoCtrl = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  'Add a new Task',
                  style: whiteTextStyle2.copyWith(
                      fontSize: 25, fontWeight: semiBold),
                ),
                TextField(
                  style: whiteTextStyle2,
                  autocorrect: false,
                  controller: todoCtrl.title,
                  decoration: const InputDecoration(
                    labelText: 'Task Title',
                    labelStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w900),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'CHOOSE TASK DATE',
                          style: whiteTextStyle2.copyWith(fontWeight: semiBold),
                        ),
                        Obx(
                          () => Text(
                            DateFormat.yMMMMEEEEd()
                                .format(todoCtrl.selectedDate.value)
                                .toString(),
                            style: whiteTextStyle2.copyWith(
                                fontSize: 10, fontWeight: semiBold),
                          ),
                        )
                      ],
                    ),
                    Container(
                      width: 160,
                      height: 40,
                      decoration: BoxDecoration(color: kBlueDarkColor),
                      child: TextButton(
                          onPressed: () {
                            todoCtrl.chooseDate();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.date_range,
                                color: kWhiteColor,
                              ),
                              Text(
                                'CHANGE DATE',
                                style:
                                    whiteTextStyle2.copyWith(fontWeight: bold),
                              )
                            ],
                          )),
                    )
                  ],
                ),
                TextField(
                  style: whiteTextStyle2,
                  autocorrect: false,
                  controller: todoCtrl.desc,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    labelStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w900),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  maxLines: null,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 155,
                      height: 40,
                      decoration: BoxDecoration(color: kBlueDarkColor),
                      child: TextButton(
                          onPressed: () {
                            todoCtrl.todos.add(Todo(
                              title: todoCtrl.title.text,
                              desc: todoCtrl.desc.text,
                              selectedDate: todoCtrl
                                  .selectedDate.value.millisecondsSinceEpoch,
                            ));

                            Get.back();
                          },
                          child: Text(
                            'ADD',
                            style: whiteTextStyle2.copyWith(fontWeight: black),
                          )),
                    ),
                    Container(
                      width: 155,
                      height: 40,
                      decoration:
                          BoxDecoration(border: Border.all(color: kRedColor)),
                      child: TextButton(
                          onPressed: () {
                            todoCtrl.title.clear();
                            todoCtrl.desc.clear();
                            todoCtrl.selectedDate = DateTime.now().obs;
                            Get.back();
                          },
                          child: Text(
                            'CANCEL',
                            style: redTextStyle.copyWith(fontWeight: black),
                          )),
                    )
                    // ignore: deprecated_member_use
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
