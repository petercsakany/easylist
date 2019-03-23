import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<String> products;

  Products(
      [this.products =
          const []]); //const to make sure we don't intend to change the list

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset('assets/food.jpg'),
          Text(products[index])
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return products.isNotEmpty ? ListView.builder(
      itemBuilder: _buildProductItem,
      itemCount: products.length,
    ) :Center(child: Text('No items found!'),);
  }
}
