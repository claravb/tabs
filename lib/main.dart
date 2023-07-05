import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabs/todo_list_screen.dart';
import 'package:tabs/todo_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MaterialApp(
        title: 'Todo List',
        home: TodoListScreen(),
      ),
    );
  }
}

/*
In this example, the TodoProvider instance is created using the ChangeNotifierProvider. The TodoListScreen widget, which we'll create next, will have access to the provider.

Finally, let's create the TodoListScreen widget, which displays the list of items and allows you to update the descriptions when tapping on an item:
 */