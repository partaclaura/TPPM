import 'package:flutter/material.dart';
import 'icons.dart';

const List<String> categories = <String>['default', 'fruit', 'drinks'];
Map<String, String> shoppingList = {};

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  // a list of items added to the shopping list
  final String appName = "ShoppingList";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text(appName,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 226, 185, 188))),
              backgroundColor: const Color.fromRGBO(57, 30, 34, 1.0),
            ),
            body: MainScreen()));
  }
}

// The main screen combines the add form and the shopping list
class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  // contains a GridView which groups the form and the list
  Widget GetBody() {
    return GridView(
      // ignore: prefer_const_constructors
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      children: [
        ShoppingList(),
        AddForm(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBody(),
    );
  }
}

class ShoppingList extends StatelessWidget {
  List<String> items = shoppingList.keys.toList();
  ShoppingList({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Shopping List',
          style: TextStyle(color: Color.fromARGB(255, 226, 185, 188)),
        ),
        backgroundColor: const Color.fromRGBO(95, 58, 66, 0.9),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              height: 50,
              margin: const EdgeInsets.all(2),
              color: const Color.fromRGBO(232, 219, 203, 0.6),
              // the list -> each element of the list has an item and a remove button
              child: ListTile(
                // the remove button -> deletes an item from the list
                trailing: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) {
                      shoppingList.remove(items[index]);
                      return MainScreen();
                    }));
                  },
                  tooltip: 'Remove item',
                  backgroundColor: const Color.fromRGBO(95, 58, 66, 0.9),
                  foregroundColor: const Color.fromARGB(255, 226, 185, 188),
                  child: const Icon(Icons.remove),
                ),

                // the item represented by a String
                title: ListTile(
                    trailing: DropdownButtonExample(item: items[index]),
                    title: Text(
                      items[index],
                      style: const TextStyle(
                          fontSize: 18, color: Color.fromRGBO(57, 30, 34, 1.0)),
                    )),
              ));
        },
      ),
      backgroundColor: const Color.fromARGB(255, 226, 185, 188),
    );
  }
}

// CATEGORY BUTTON
class DropdownButtonExample extends StatefulWidget {
  String item;
  DropdownButtonExample({required this.item});

  @override
  State<DropdownButtonExample> createState() =>
      _DropdownButtonExampleState(item: item);
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String item;
  _DropdownButtonExampleState({required this.item});
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: shoppingList[item] ?? "default",
      icon: pickIcon(shoppingList[item] ?? "default"),
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      onChanged: (String? value) {
        setState(() {
          shoppingList[item] = value!;
        });
      },
      items: categories.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class AddForm extends StatefulWidget {
  AddForm({super.key});

  @override
  State<AddForm> createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  final myController = TextEditingController();
  _AddFormState();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add item to shopping list',
            style: TextStyle(color: Color.fromARGB(255, 226, 185, 188))),
        backgroundColor: const Color.fromRGBO(95, 58, 66, 0.9),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),

        // the text field for the item
        child: TextField(
          controller: myController,
          cursorColor: const Color.fromRGBO(95, 58, 66, 0.9),
        ),
      ),

      // the button to add an item to the list
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (builder) {
            shoppingList[myController.text] = "default";
            return MainScreen();
          }));
        },
        tooltip: 'Add item',
        backgroundColor: const Color.fromRGBO(95, 58, 66, 0.9),
        foregroundColor: const Color.fromARGB(255, 226, 185, 188),
        child: const Icon(Icons.plus_one),
      ),
      backgroundColor: const Color.fromARGB(255, 226, 185, 188),
    );
  }
}
