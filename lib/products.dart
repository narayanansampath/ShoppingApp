import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  final List<Map<String, dynamic>> product;
  //final Function deleteProduct;

  Product(this.product);

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
                        context, '/product/' + index.toString()),
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
