import 'package:flutter/material.dart';

import './pages/product.dart';

class Product extends StatelessWidget {
  final List<Map<String, String>> product;
  final Function deleteProduct;

  Product(this.product, {this.deleteProduct});

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(product[index]['image']),
          Text(product[index]['title']),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('Details'),
                onPressed: () => Navigator.pushNamed<bool>(
                        context, '/product/' + index.toString())
                    .then((bool value) {
                  if (value) {
                    deleteProduct(index);
                  }
                }),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildProductList() {
    Widget productCards;
    if (product.length > 0) {
      productCards = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: product.length,
      );
    } else {
      //productCards = Container();  //If you dont want to show anything if you get null value
      productCards = Center(
        child: Text('No products found, please add some'),
      );
    }

    return productCards;
  }

  @override
  Widget build(BuildContext context) {
    return _buildProductList();
  }
}
