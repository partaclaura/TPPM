import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  // a list of items added to the shopping list
  List<String> shoppingListItems = [];
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
            body: MainScreen(
              shoppingList: [],
            )));
  }
}

// The main screen combines the add form and the shopping list
class MainScreen extends StatelessWidget {
  List<String> shoppingList;
  MainScreen({required this.shoppingList});

  // contains a GridView which groups the form and the list
  Widget GetBody(List<String> items) {
    return GridView(
      // ignore: prefer_const_constructors
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      children: [
        ShoppingList(items: items),
        AddForm(
          crtList: shoppingList,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBody(shoppingList),
    );
  }
}

class ShoppingList extends StatelessWidget {
  List<String> items;
  ShoppingList({required this.items});
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
                      items.remove(items[index]);
                      return MainScreen(shoppingList: items);
                    }));
                  },
                  tooltip: 'Remove item',
                  backgroundColor: const Color.fromRGBO(95, 58, 66, 0.9),
                  foregroundColor: const Color.fromARGB(255, 226, 185, 188),
                  child: const Icon(Icons.remove),
                ),

                // the item represented by a String
                title: Text(
                  items[index],
                  style: const TextStyle(
                      fontSize: 18, color: Color.fromRGBO(57, 30, 34, 1.0)),
                ),
              ));
        },
      ),
      backgroundColor: const Color.fromARGB(255, 226, 185, 188),
    );
  }
}

class AddForm extends StatefulWidget {
  List<String> crtList;
  AddForm({required this.crtList});

  @override
  State<AddForm> createState() => _AddFormState(crtList: crtList);
}

class _AddFormState extends State<AddForm> {
  final myController = TextEditingController();
  List<String> crtList;
  _AddFormState({required this.crtList});

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
            crtList.add(myController.text);
            return MainScreen(shoppingList: crtList);
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
