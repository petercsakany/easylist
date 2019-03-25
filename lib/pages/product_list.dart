import 'package:flutter/material.dart';

import '../products_manager.dart';
import '../drawer.dart';

class ProductListPage extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function addProduct;
  final Function deleteProduct;

  ProductListPage(this.products, this.addProduct, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ProductDrawer('list'),
      appBar: AppBar(
        title: Text('Easylist'),
      ),
      body: ProductManager(products, addProduct, deleteProduct),
    );
  }
}
