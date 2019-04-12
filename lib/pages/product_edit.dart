import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import '../models/product.dart';
import '../scoped-models/products.dart';

class ProductEditPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductEditPage();
  }
}

class _ProductEditPage extends State<ProductEditPage> {
  final Map<String, dynamic> _formData = {
    'title': null,
    'image': 'assets/food.jpg',
    'description': null,
    'price': null
  };

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submitForm(Function addProduct, Function updateProduct,
      [int selectedProductIndex]) {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    if (selectedProductIndex == null) {
      addProduct(Product(
          title: _formData['title'],
          description: _formData['description'],
          price: _formData['price'],
          image: _formData['image']));
    } else {
      updateProduct(Product(
          title: _formData['title'],
          description: _formData['description'],
          price: _formData['price'],
          image: _formData['image']));
    }

    Navigator.pushReplacementNamed(context, '/list');
  }

  TextFormField buildDescriptionTextField(Product product) {
    return TextFormField(
        decoration: InputDecoration(
          labelText: 'Description',
        ),
        keyboardType: TextInputType.multiline,
        maxLines: 4,
        initialValue: product == null ? '' : product.description,
        validator: (String input) {
          if (input.isEmpty) {
            return 'Description is required.';
          }
        },
        onSaved: (String value) {
          _formData['description'] = value;
        });
  }

  TextFormField buildPriceTextField(Product product) {
    return TextFormField(
        decoration: InputDecoration(
          labelText: 'Price',
        ),
        initialValue: product == null ? '' : product.price.toString(),
        validator: (String input) {
          if (input.isEmpty || double.tryParse(input) == null) {
            return 'Price is required to be a number.';
          }
        },
        keyboardType: TextInputType.number,
        onSaved: (String value) {
          _formData['price'] = double.parse(value);
        });
  }

  TextFormField buildTitleTextField(Product product) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Title',
      ),
      initialValue: product == null ? '' : product.title,
      validator: (String input) {
        if (input.isEmpty) {
          return 'Title is required.';
        }
      },
      onSaved: (String value) {
        _formData['title'] = value;
      },
    );
  }

  Widget buildSubmitButton() {
    return ScopedModelDescendant<ProductsModel>(
        builder: (BuildContext context, Widget child, ProductsModel model) {
      return RaisedButton(
        child: Text('Save'),
        onPressed: () => _submitForm(
            model.addProduct, model.updateProduct, model.selectedProductIndex),
      );
    });
  }

  Container buildPageContent(Product product) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            buildTitleTextField(product),
            SizedBox(
              height: 5.0,
            ),
            buildPriceTextField(product),
            SizedBox(
              height: 5.0,
            ),
            buildDescriptionTextField(product),
            SizedBox(
              height: 10.0,
            ),
            buildSubmitButton()
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProductsModel>(
        builder: (BuildContext context, Widget child, ProductsModel model) {
      final Widget pageContent = buildPageContent(model.selectedProduct);
      return model.selectedProductIndex == null
          ? pageContent
          : Scaffold(
              appBar: AppBar(
                title: Text('Edit Product'),
              ),
              body: pageContent,
            );
    });
  }
}
