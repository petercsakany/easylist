import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import './product_edit.dart';
import '../scoped-models/products.dart';

class ProductEditListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProductsModel>(
        builder: (BuildContext context, Widget child, ProductsModel model) {
      return ListView.builder(
        itemCount: model.products.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key('${index.toString() + model.products[index].title}'),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
            ),
            onDismissed: (DismissDirection dismissDirection) {
              if (dismissDirection == DismissDirection.endToStart) {
                model.selectProduct(index);
                model.deleteProduct();
              }
            },
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(model.products[index].image),
                  ),
                  title: Text('${model.products[index].title + ' ' + index.toString()}'),
                  subtitle: Text('\$${model.products[index].price.toString()}'),
                  trailing: buildEditButton(context, index, model),
                ),
                Divider(
                  height: 16.0,
                )
              ],
            ),
          );
        },
      );
    });
  }

  Widget buildEditButton(BuildContext context, int index, ProductsModel model) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        model.selectProduct(index);
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return ProductEditPage();
        }));
      },
    );
  }
}
