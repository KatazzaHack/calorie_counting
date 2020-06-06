import 'package:flutter/material.dart';
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
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      child: new Text("Add new dish"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddProductPage()),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child:
                    RaisedButton(
                      child: new Text("Add new product"),
                      onPressed: null,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
