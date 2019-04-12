import 'package:flutter/material.dart';
import './product_edit.dart';

class ProductEditListPage extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final Function updateProduct;

  ProductEditListPage(this.products, this.updateProduct);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.brown.shade300,
            child: Text('AH'),
          ),
          title: Text(products[index]['title']),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return ProductEditPage(
                  product: products[index],
                  updateProduct: updateProduct,
                  productIndex: index,
                );
              }));
            },
          ),
        );
      },
    );
  }
}
