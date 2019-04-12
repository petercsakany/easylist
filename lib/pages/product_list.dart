import 'package:flutter/material.dart';

import '../widgets/products.dart';
import '../widgets/drawer.dart';
import '../models/product.dart';

class ProductListPage extends StatelessWidget {
  final List<Product> products;

  ProductListPage(this.products);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ProductDrawer('list'),
      appBar: AppBar(
        title: Text('Easylist'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {},
          ),
        ],
      ),
      body: Products(products),
    );
  }
}
