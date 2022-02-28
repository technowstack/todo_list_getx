// ignore_for_file: file_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_list_getx/models/todo.dart';

class TodoController extends GetxController{
var selectedDate = DateTime.now().obs;
var todos = List<Todo>.empty().obs;

final TextEditingController title = TextEditingController();
final TextEditingController desc = TextEditingController();


chooseDate () async {
  DateTime? pickDate =  await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value
        firstDate: DateTime(2020),
        lastDate: DateTime(2050),);
      if(pickDate != null && pickDate != selectedDate.value){
        selectedDate.value = pickDate;
      }
  }

  @override
  void onInit() {
    
    List? storedTodos = GetStorage().read<List>('todo');
    if(storedTodos != null){
      todos = storedTodos.map((e) => Todo.fromJson(e)).toList().obs;
      title.clear();
      desc.clear();
      selectedDate = DateTime.now().obs;
    }
    ever(todos, (_){
      GetStorage().write('todo', todos.toList());
      selectedDate = DateTime.now().obs;
      title.clear();
      desc.clear();
    });
    
    super.onInit();
  }
  @override
  void onClose() {
    title.dispose();
    desc.dispose();
    super.onClose();
  }

}