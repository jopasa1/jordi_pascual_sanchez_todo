import 'package:flutter/material.dart';
import 'model.dart';

class ToDoController{
  void addToModelList(String string){
    TodoList().addToList(string);
  }
  getList(){
    return TodoList().todoList;
  }
}