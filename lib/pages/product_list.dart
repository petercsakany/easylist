import 'package:flutter/material.dart';

import '../products_manager.dart';
import '../drawer.dart';

class ProductListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ProductDrawer('list'),
      appBar: AppBar(
        title: Text('Easylist'),
      ),
      body: ProductManager(),
    );
  }
}
