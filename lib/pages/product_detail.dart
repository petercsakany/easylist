import 'dart:async';

import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import '../scoped-models/products.dart';

class ProductDetailPage extends StatelessWidget {
  final int productIndex;

  ProductDetailPage(this.productIndex);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: ScopedModelDescendant<ProductsModel>(
        builder: (BuildContext context, Widget child, ProductsModel model) {
          return Scaffold(
              appBar: AppBar(
                title: Text(model.products[productIndex].title),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Image.asset(model.products[productIndex].image),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        model.products[productIndex].title,
                        style: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Comic Sans',
                        ),
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        'Price: \$${model.products[productIndex].price.toString()}',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.grey, width: 3))),
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        'Description:',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        model.products[productIndex].description,
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
