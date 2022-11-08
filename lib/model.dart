import 'package:flutter/material.dart';
import 'event_controller.dart';

class TodoList{

  static final TodoList _modelo = TodoList._internal();

  factory TodoList() {
    return _modelo;
  }

  TodoList._internal():
        _todoList = <String>[];

  List<String> _todoList;

  addToList (String value) {
    _todoList.add(value);
  }

  List<String> get todoList => _todoList;
}

