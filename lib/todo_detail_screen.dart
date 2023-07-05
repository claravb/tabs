import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabs/Todo.dart';
import 'package:tabs/add_string_screen.dart';
import 'package:tabs/todo_provider.dart';

class TodoDetailsScreen extends StatefulWidget {
  final int index;

  const TodoDetailsScreen({required this.index});

  @override
  _TodoDetailsScreenState createState() => _TodoDetailsScreenState();
}

class _TodoDetailsScreenState extends State<TodoDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late List<String> _sublist1;
  late List<String> _sublist2;
  late String _property1;
  late String _property2;

  @override
  void initState() {
    super.initState();
    final todoProvider = Provider.of<TodoProvider>(context, listen: false);
    final todoList = todoProvider.todoList;
    final selectedTodo = todoList[widget.index];

    _titleController = TextEditingController(text: selectedTodo.title);
    _descriptionController =
        TextEditingController(text: selectedTodo.description);
    _sublist1 = List.from(selectedTodo.sublist1);
    _sublist2 = List.from(selectedTodo.sublist2);
    _property1 = selectedTodo.property1;
    _property2 = selectedTodo.property2;

    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);
    final todoList = todoProvider.todoList;
    final selectedTodo = todoList[widget.index];

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedTodo.title),
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: [
              const Tab(text: 'Tab 1'),
              const Tab(text: 'Tab 2'),
              const Tab(text: 'Tab 3'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildTab1(),
                _buildTab2(),
                _buildTab3(),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _updateTodo(context);
            },
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }

  // Widget _buildTab1() {
  //   return ListView.builder(
  //     itemCount: _sublist1.length,
  //     itemBuilder: (context, index) {
  //       return ListTile(
  //         title: Text(_sublist1[index]),
  //         // Implement your logic to update _sublist1
  //         // when the user interacts with the tab
  //       );
  //     },
  //   );
  // }

  Widget _buildTab1() {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            _navigateToAddStringScreen();
          },
          child: Text('Add String'),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: _sublist1.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_sublist1[index]),
            );
          },
        ),
      ],
    );
  }

  /*
  To add a button in Tab 1 that navigates to a form for adding a string to sublist1, you can use the Navigator class to push a new route containing the form screen. Here's an updated version of the _buildTab1 method that includes the button and navigation logic:

  In the _buildTab1 method, we've added an ElevatedButton widget that triggers the _navigateToAddStringScreen method when pressed. This method uses the Navigator class to push a new route containing the AddStringScreen.

In the _navigateToAddStringScreen method, we use the MaterialPageRoute to define the route for the AddStringScreen. We pass a callback function onStringAdded to the AddStringScreen constructor. This callback will handle the logic of adding the new string to _sublist1.

Next, you need to create the AddStringScreen widget where the user can input the new string. Here's an example of how you can implement it:


   */

  void _navigateToAddStringScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddStringScreen(
          onStringAdded: _handleStringAdded,
        ),
      ),
    );
  }

  void _handleStringAdded(String newString) {
    setState(() {
      _sublist1.add(newString);
    });
  }

  Widget _buildTab2() {
    return ListView.builder(
      itemCount: _sublist2.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_sublist2[index].toString()),
          // Implement your logic to update _sublist2
          // when the user interacts with the tab
        );
      },
    );
  }

  Widget _buildTab3() {
    return Column(
      children: [
        TextField(
          controller: _titleController,
          decoration: const InputDecoration(labelText: 'Title'),
        ),
        TextField(
          controller: _descriptionController,
          decoration: const InputDecoration(labelText: 'Description'),
        ),
        // TextField(
        //   controller: _property1,
        //   decoration: const InputDecoration(labelText: 'Title'),
        // ),
        // TextField(
        //   controller: _property2,
        //   decoration: const InputDecoration(labelText: 'Description'),
        // ),
        // Implement your logic to update _property1 and _property2
        // when the user interacts with the tab
      ],
    );
  }

  void _updateTodo(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context, listen: false);
    final todoList = todoProvider.todoList;
    final selectedTodo = todoList[widget.index];

    final updatedTodo = selectedTodo.copyWith(
      title: _titleController.text,
      description: _descriptionController.text,
      sublist1: List.from(_sublist1),
      sublist2: List.from(_sublist2),
      property1: _property1,
      property2: _property2,
    );

    todoProvider.updateTodo(widget.index, updatedTodo);

    Navigator.pop(context); // Go back to the TodoListScreen
  }
}




/*
 In this example, I've added the necessary variables _sublist1, _sublist2, _property1, and _property2 to track the changes made in each tab. Inside _buildTab1, _buildTab2, and _buildTab3, you can implement your logic to update the respective variables as the user interacts with each tab.

In the _buildTab3 method, I've also added TextField widgets to update the title and description properties. You can adjust this to match the properties of your Todo class.

When the "Update" button is pressed, _updateTodo method is called. It retrieves the updated values from the corresponding variables and creates a new Todo object with the changes. It then calls the updateTodo method of the TodoProvider to update the item in the list.

Make sure to replace updateTodo with the appropriate method in your TodoProvider to update the item correctly.
With these changes, you should be able to update the sublist and properties of the item object in each tab, and the "Update" button will apply all the changes when pressed.
*/