import 'package:flutter/material.dart';

class AddStringScreen extends StatelessWidget {
  final Function(String) onStringAdded;

  const AddStringScreen({super.key, required this.onStringAdded});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add String'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
              decoration: const InputDecoration(
                labelText: 'String',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final newString = textEditingController.text;
                onStringAdded(newString);
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}

/*
In the AddStringScreen, we've added a TextField widget where the user can input the new string. When the "Add" button is pressed, the _textEditingController.text is retrieved, and the onStringAdded callback is called with the new string. After that, we use Navigator.pop(context) to navigate back to the previous screen (in this case, Tab 1).

By implementing these changes, you can now add a string to sublist1 from the form screen in Tab 1. The added string will be reflected in the ListView.builder widget, and you can see it in real-time. */