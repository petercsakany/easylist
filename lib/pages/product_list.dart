import 'package:flutter/material.dart';

import '../products_manager.dart';

class ProductListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Easylist'),
      ),
      body: ProductManager(),
    );
  }
}
