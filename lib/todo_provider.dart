import 'package:flutter/material.dart';
import 'package:tabs/Todo.dart';

class TodoProvider extends ChangeNotifier {
  /*
  class TodoProvider extends ChangeNotifier {
  List<Todo> _todoList = [];

  List<Todo> get todoList => _todoList;

  

  // Other methods...

  void updateTodo(int index, Todo updatedTodo) {
    _todoList[index] = updatedTodo;
    notifyListeners();
  }
}
 */
  List<Todo> _todoList = [
    Todo(
        title: 'Item 1',
        description: 'Description 1',
        sublist1: ['flor 1', 'flor 2'],
        sublist2: ['star 1', 'star 2', 'star 3', 'star 4'],
        property1: 'propiedad 1',
        property2: 'propiedad 2'),
    Todo(
        title: 'Item 2',
        description: 'Description 2',
        sublist1: ['f 1', 'f 2'],
        sublist2: ['s 1', 's 2', 's 3', 's 4'],
        property1: 'prop 1',
        property2: 'prop 2'),
    Todo(
        title: 'Item 3',
        description: 'Description 3',
        sublist1: ['flor 1', 'flor 2'],
        sublist2: ['star 1', 'star 2', 'star 3', 'star 4'],
        property1: 'propiedad 1',
        property2: 'propiedad 2'),
  ];

  List<Todo> get todoList => _todoList;

  Future<void> fetchTodoList() async {
    // Make API call to fetch the list of items
    try {
      // Make the API call and get the response
      final response = await YourAPIService.fetchTodoList();

      // Assuming the API response is a list of items, you can map the response
      // to your Todo class and update the todoList
      _todoList = response.map((item) => Todo.fromJson(item)).toList();

      notifyListeners();
    } catch (error) {
      // Handle error
      print('Error fetching todo list: $error');
    }
  }
  /*
  In the example above, we've added a fetchTodoList method to the TodoProvider. Inside this method, you can make an API call to fetch the list of items. You can use a service class (e.g., YourAPIService) to handle the API calls and retrieve the response.

Once you get the response, you can map it to your Todo class using the fromJson method (assuming you have implemented it) and update the _todoList with the fetched items. After updating the list, call notifyListeners() to notify any listeners (such as the TodoListScreen) that the state has changed.

To use the fetchTodoList method, you can call it in the initState method of your screen or any other appropriate place: */

  void updateTodoDescription(int index, String newDescription) {
    _todoList[index] = _todoList[index].copyWith(description: newDescription);
    notifyListeners();
  }

  void updateTodo(int index, Todo updatedTodo) {
    _todoList[index] = updatedTodo;
    notifyListeners();
  }
  /*
  In the updateTodo method of the TodoProvider, you can update the corresponding item object at the specified index with the updatedTodo object. After updating the list, you call notifyListeners() to notify any listeners (such as the TodoListScreen) that the state has changed.

By calling notifyListeners(), the TodoListScreen will be rebuilt, and it will reflect the updated item object in the list.

Remember to wrap your TodoListScreen widget with a Provider widget and listen to changes in the TodoProvider using Consumer or Provider.of to ensure that the screen rebuilds when the list is updated. */
}


/*
In the above code, the TodoProvider class extends ChangeNotifier from the provider package. It holds a list of Todo objects and provides a getter method for the list. The updateTodoDescription method updates the description of a specific item and notifies the listeners that the state has changed.

Next, wrap your app's root widget with a ChangeNotifierProvider to make the TodoProvider accessible to the child widgets:
 */