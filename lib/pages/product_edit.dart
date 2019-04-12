import 'package:flutter/material.dart';

class ProductEditPage extends StatefulWidget {
  final Function addProduct;
  final Function updateProduct;
  final Map<String, dynamic> product;
  final int productIndex;

  ProductEditPage(
      {this.addProduct, this.updateProduct, this.product, this.productIndex});
  @override
  State<StatefulWidget> createState() {
    return _ProductEditPage();
  }
}

class _ProductEditPage extends State<ProductEditPage> {
  final Map<String, dynamic> _product = {
    'title': null,
    'image': 'assets/food.jpg',
    'description': null,
    'price': null
  };

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submitForm() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    if(widget.product == null) {
      widget.addProduct(_product);
    }
    else {
      widget.updateProduct(widget.productIndex, _product);
    }

    Navigator.pushReplacementNamed(context, '/list');
  }

  TextFormField buildDescriptionTextField() {
    return TextFormField(
        decoration: InputDecoration(
          labelText: 'Description',
        ),
        keyboardType: TextInputType.multiline,
        maxLines: 4,
        initialValue:
            widget.product == null ? '' : widget.product['description'],
        validator: (String input) {
          if (input.isEmpty) {
            return 'Description is required.';
          }
        },
        onSaved: (String value) {
          _product['description'] = value;
        });
  }

  TextFormField buildPriceTextField() {
    return TextFormField(
        decoration: InputDecoration(
          labelText: 'Price',
        ),
        initialValue:
            widget.product == null ? '' : widget.product['price'].toString(),
        validator: (String input) {
          if (input.isEmpty || double.tryParse(input) == null) {
            return 'Price is required to be a number.';
          }
        },
        keyboardType: TextInputType.number,
        onSaved: (String value) {
          _product['price'] = double.parse(value);
        });
  }

  TextFormField buildTitleTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Title',
      ),
      initialValue: widget.product == null ? '' : widget.product['title'],
      validator: (String input) {
        if (input.isEmpty) {
          return 'Title is required.';
        }
      },
      onSaved: (String value) {
        _product['title'] = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Widget pageContent = Container(
      margin: EdgeInsets.all(10.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            buildTitleTextField(),
            SizedBox(
              height: 5.0,
            ),
            buildPriceTextField(),
            SizedBox(
              height: 5.0,
            ),
            buildDescriptionTextField(),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              child: Text('Save'),
              onPressed: _submitForm,
            )
          ],
        ),
      ),
    );
    return widget.product == null
        ? pageContent
        : Scaffold(
            appBar: AppBar(
              title: Text('Edit Product'),
            ),
            body: pageContent,
          );
  }
}
