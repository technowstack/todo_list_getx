// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unused_local_variable, unnecessary_null_comparison, unnecessary_this

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/todoController.dart';
import '../shared/theme.dart';

class TodoEdit extends StatelessWidget {
  final int index;

  TodoEdit({required this.index});

  final TodoController todoCtrl = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    String? title;
    String? desc;
    title = todoCtrl.todos[index].title;
    desc = todoCtrl.todos[index].desc;

    TextEditingController titleEditingController =
        TextEditingController(text: title);

    TextEditingController descEditingController =
        TextEditingController(text: desc);

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
                  'Edit Task',
                  style: whiteTextStyle2.copyWith(
                      fontSize: 25, fontWeight: semiBold),
                ),
                TextField(
                  style: whiteTextStyle2,
                  autocorrect: false,
                  controller: titleEditingController,
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
                                .format(
                                  DateTime.fromMillisecondsSinceEpoch(
                                    todoCtrl.todos[index].selectedDate!.toInt(),
                                  ),
                                )
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
                            todoCtrl.selectedDate.value =
                                DateTime.fromMillisecondsSinceEpoch(todoCtrl
                                    .todos[index].selectedDate!
                                    .toInt());
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
                  controller: descEditingController,
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
                            var editing = todoCtrl.todos[index];
                            editing.title = titleEditingController.text;
                            editing.selectedDate = todoCtrl
                                .selectedDate.value.millisecondsSinceEpoch;
                            editing.desc = descEditingController.text;
                            todoCtrl.todos[index] = editing;
                            Get.back();
                          },
                          child: Text(
                            'UPDATE',
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
