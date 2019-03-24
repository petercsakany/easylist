import 'package:flutter/material.dart';

import '../drawer.dart';

class ProductAdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: ProductDrawer('admin'),
        appBar: AppBar(
          title: Text('Manage Product'),
        ),
        body: Center(
          child: Text('Manage your product.'),
        ),
      );
  }
}
