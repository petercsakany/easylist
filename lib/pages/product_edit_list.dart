import 'package:flutter/material.dart';
import './product_edit.dart';

class ProductEditListPage extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final Function updateProduct;
  final Function deleteProduct;

  ProductEditListPage(this.products, this.updateProduct, this.deleteProduct);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: Key('${index.toString() + products[index]['title']}'),
          direction: DismissDirection.endToStart,
          background: Container(
            color: Colors.red,
          ),
          onDismissed: (DismissDirection dismissDirection) {
            if (dismissDirection == DismissDirection.endToStart) {
              deleteProduct(index);
            }
          },
          child: Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(products[index]['image']),
                ),
                title: Text(products[index]['title']),
                subtitle: Text('\$${products[index]['price'].toString()}'),
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
              ),
              Divider(
                height: 16.0,
              )
            ],
          ),
        );
      },
    );
  }
}
