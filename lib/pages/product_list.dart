import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import '../widgets/products.dart';
import '../widgets/drawer.dart';
import '../scoped-models/products.dart';

class ProductListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ProductDrawer('list'),
      appBar: AppBar(
        title: Text('Easylist'),
        actions: <Widget>[
          ScopedModelDescendant<ProductsModel>(builder:
              (BuildContext context, Widget child, ProductsModel model) {
            return IconButton(
              icon: Icon(model.displayFavoriteOnly? Icons.favorite : Icons.favorite_border),
              onPressed: () {
                model.toggleFavoritesDisplay();
              },
            );
          }),
        ],
      ),
      body: Products(),
    );
  }
}
