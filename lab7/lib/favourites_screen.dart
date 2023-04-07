import 'package:flutter/material.dart';

class FavouritesScreen extends StatelessWidget {
  FavouritesScreen({super.key});

  // contains a GridView which groups the form and the list
  Widget GetBody(BuildContext context) {
    return GridView(
        // ignore: prefer_const_constructors
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        children: List.generate(
          100,
          (index) {
            return Center(
              child: Text(
                'Item $index',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            );
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBody(context),
    );
  }
}
