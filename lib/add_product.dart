import 'package:flutter/material.dart';
import 'database/products_helper.dart';
import 'gen/calorie_counting.pb.dart';
import 'weighted_product.dart';

class AddProductPage extends StatefulWidget {
  ListSearchState createState() => ListSearchState();
}

class ListSearchState extends State<AddProductPage> {
  ProductsHelper _productsHelper = ProductsHelper();
  TextEditingController _textController = TextEditingController();

  // Copy Main List into New List.
  Future<List<Product>> newDataList;

  @override
  void initState() {
    super.initState();
    newDataList = _productsHelper.searchBySubstring("");
  }

  onItemChanged(String value) async {
    setState(() {
      newDataList = _productsHelper.searchBySubstring(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: newDataList,
      builder: (context, AsyncSnapshot<List<Product>> snapshot) {
        if (snapshot.hasData) {
          return Container(
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
                    children: snapshot.data.map((data) {
                      return ListTile(
                        title: Text(data.name),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    WeightedProductPage(product: data)),
                          );
                        },
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
