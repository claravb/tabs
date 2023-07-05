import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabs/todo_detail_screen.dart';
import 'package:tabs/todo_provider.dart';

/*class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchTodoList();
  }

  Future<void> _fetchTodoList() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await YourAPIService.fetchTodoList();

      final todoList = response.map((item) => Todo.fromJson(item)).toList();

      final todoProvider = Provider.of<TodoProvider>(context, listen: false);
      todoProvider.setTodoList(todoList);
    } catch (error) {
      // Handle error
      print('Error fetching todo list: $error');
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);
    final todoList = todoProvider.todoList;

    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (todoList.isEmpty) {
      return Center(child: Text('No items found.'));
    }

    return ListView.builder(
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        final todo = todoList[index];
        return ListTile(
          title: Text(todo.title),
          subtitle: Text(todo.description),
          // Rest of your ListTile implementation
        );
      },
    );
  }
}

If you prefer not to use the hooks_riverpod package, you can achieve the same functionality using the traditional StatefulWidget approach. Here's an example of how you can modify the TodoListScreen to fetch the data from an API without using hooks_riverpod:

dart
Copy code
class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchTodoList();
  }

  Future<void> _fetchTodoList() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await YourAPIService.fetchTodoList();

      final todoList = response.map((item) => Todo.fromJson(item)).toList();

      final todoProvider = Provider.of<TodoProvider>(context, listen: false);
      todoProvider.setTodoList(todoList);
    } catch (error) {
      // Handle error
      print('Error fetching todo list: $error');
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);
    final todoList = todoProvider.todoList;

    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (todoList.isEmpty) {
      return Center(child: Text('No items found.'));
    }

    return ListView.builder(
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        final todo = todoList[index];
        return ListTile(
          title: Text(todo.title),
          subtitle: Text(todo.description),
          // Rest of your ListTile implementation
        );
      },
    );
  }
}
In this approach, we use the StatefulWidget and State to manage the loading state of the data. The _isLoading variable is used to determine whether to display a loading indicator (CircularProgressIndicator) or the actual list of todos.

In the _fetchTodoList method, we update the _isLoading state to true to show the loading indicator. Then, we make the API call to fetch the list of todos and update the todoList in the TodoProvider. Finally, we update the _isLoading state to false to hide the loading indicator.

In the build method, we check the _isLoading state and display either the loading indicator or the actual list of todos using ListView.builder.

Remember to replace YourAPIService with your actual API service class that handles the API calls and response mapping.

With this modified approach, you can fetch the list of items from an API and display them in the TodoListScreen without using the hooks_riverpod package.
*/

class TodoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);
    final todoList = todoProvider.todoList;

    return Consumer<TodoProvider>(builder: (context, todoProvider, _) {
      final todoList = todoProvider.todoList;

      return Scaffold(
        appBar: AppBar(
          title: Text('Todo List'),
        ),
        body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            final todo = todoList[index];

            return ListTile(
              title: Text(todo.title),
              subtitle: Text(todo.description),
              onTap: () {
                _navigateToTodoDetails(context, index);
              },
            );
          },
        ),
      );
    });
  }

  void _navigateToTodoDetails(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TodoDetailsScreen(index: index),
      ),
    );
  }
}

/**
In the TodoListScreen, we use the Provider.of method to access the TodoProvider instance. We then retrieve the todoList from the provider and display it using a ListView.builder. When you tap on an item, it navigates to the TodoDetailsScreen and passes the index of the selected item.

Now, let's create the TodoDetailsScreen, which allows you to update the description of the selected item:
 */