import 'package:flutter/material.dart';
import 'model.dart';
import 'event_controller.dart';

void main() {
  runApp(Todo());
}

class Todo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'jordi_pascual_sanchez_todo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => TodoList(),
      },
    );
  }
}
final ToDoController _controlador = ToDoController();

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  // save data
  final List<String> _todoList = <String>[];
  // text field
  final TextEditingController _textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // app layout
    return Scaffold(
      appBar: AppBar(title: const Text('To-Do List')),
      body: ListView(children: _getItems()),
      // add items to the to-do list
      floatingActionButton: FloatingActionButton(
          onPressed: () => _displayDialog(context),
          tooltip: 'Add Item',
          child: Icon(Icons.add)),
    );
  }
  void _addTodoItem(String title){
    setState(() {
      _controlador.addToModelList(_textFieldController.text);
    });
    _textFieldController.clear();
  }
  Widget _buildTodoItem(String title){
    return ListTile(title: Text(title));
  }
  Future<AlertDialog> _displayDialog(BuildContext context) async {
    // alter the app state to show a dialog
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add a task to your list'),
            content: TextField(
              controller: _textFieldController,
              decoration: const InputDecoration(hintText: 'Enter task here'),
            ),
            actions: <Widget>[
              // add button
              TextButton(
                child: const Text('ADD'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _addTodoItem(_textFieldController.text);
                },
              ),
              // cancel button
              TextButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        }) as Future<AlertDialog>;
  }
  // iterates through our to3do list titles.
  List<Widget> _getItems() {
    final List<Widget> _todoWidgets = <Widget>[];
    for (String title in _controlador.getList()) {
      _todoWidgets.add(_buildTodoItem(title));
    }
    return _todoWidgets;
  }
}