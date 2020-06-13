import 'package:flutter/material.dart';
import 'add_new_dish_page.dart';
import 'add_new_product_page.dart';
import 'add_product.dart';

class FoodSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add meal"),
      ),
      body: Column(
        children: <Widget>[
          AddProductPage(),
          NewMealEntityButtons(),
        ],
      ),
    );
  }
}

class NewMealEntityButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddNewDishPage()),
                  );
                },
              ),
            ),
            Expanded(
              child: RaisedButton(
                child: new Text("Add new product"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddNewProductPage()),
                  );
                },
                tooltip: "Add new product",
                child: Icon(Icons.restaurant),
                heroTag: null),
          ],
        ),
      ),
    );
  }
}
