import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import './price_tag.dart';
import '../models/product.dart';
import '../scoped-models/products.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final int index;

  ProductCard(this.product, this.index);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(
            product.image,
            width: 250.0,
            height: 250.0,
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  product.title,
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Comic Sans',
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                PriceTag(product.price.toString()),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  border: Border.all(color: Colors.grey, width: 1.0)),
              child: Text('Union Square, San Fransisco')),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.info),
                iconSize: 30.0,
                color: Theme.of(context).primaryColor,
                onPressed: () => Navigator.pushNamed<bool>(
                            context, '/product/' + index.toString())
                        .then((bool value) {
                      if (value) {
                        print('changed later..');
                      }
                    }),
              ),
              ScopedModelDescendant<ProductsModel>(builder:
                  (BuildContext context, Widget child, ProductsModel model) {
                return IconButton(
                  icon: Icon(model.displayProducts[index].isFavorite? Icons.favorite : Icons.favorite_border),
                  iconSize: 30.0,
                  color: Colors.red,
                  onPressed: () {
                    model.selectProduct(index);
                    model.toggleProductFavorite();
                  },
                );
              }),
            ],
          )
        ],
      ),
    );
  }
}
