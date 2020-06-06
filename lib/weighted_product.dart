import 'package:calorie_counting/gen/calorie_counting.pb.dart';
import 'package:flutter/material.dart';
import 'gen/calorie_counting.pb.dart';

class WeightedProductPage extends StatefulWidget {
  final Product product;

  const WeightedProductPage({Key key, this.product}) : super(key: key);

  @override
  WeightedProductPageState createState() => WeightedProductPageState();
}

class WeightedProductPageState extends State<WeightedProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text(widget.product.name),
            Row(
              children: <Widget>[
                Text('Калории'),
                Text(widget.product.calorie.toString()),
              ]
            )
          ]
        )
      )
    );
  }
}
