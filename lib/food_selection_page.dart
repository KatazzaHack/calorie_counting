import 'package:flutter/material.dart';
import 'add_product.dart';

class FoodSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Food selection"),
      ),
      body: Center(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              child: new Text("Add product"),
              color:  Colors.blue,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddProductPage()),
                );
              },
            ),
            RaisedButton(
              child: new Text("Add dish"),
              color:  Colors.yellow,
              onPressed: null,
            ),
          ],

        ),
      ),
    );
  }
}
