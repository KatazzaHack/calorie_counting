import 'package:flutter/material.dart';
import 'database/products_helper.dart';
import 'gen/calorie_counting.pb.dart';

class AddProductPage extends StatefulWidget {
  ListSearchState createState() => ListSearchState();
}

class ListSearchState extends State<AddProductPage> {
  ProductsHelper _productsHelper = ProductsHelper();
  TextEditingController _textController = TextEditingController();

  // Copy Main List into New List.
  static List<Product> newDataListS = initList();
  List<Product> newDataList = newDataListS;

  static List<Product> initList() {
    Product p = Product();
    p.name = "anton";
    return [p];
  }

  onItemChanged(String value) async {
    List<Product> searchResult = await _productsHelper.searchBySubstring(value);
    setState(() {
      newDataList = searchResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black38,
      height: MediaQuery.of(context).size.height * 0.8,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Search Product...',
              ),
              onChanged: onItemChanged,
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(12.0),
              children: newDataList.map((data) {
                return ListTile(
                  title: Text(data.name),
                  onTap: ()=> print(data),);
                }
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}