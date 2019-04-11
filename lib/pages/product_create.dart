import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;

  ProductCreatePage(this.addProduct);
  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePage();
  }
}

class _ProductCreatePage extends State<ProductCreatePage> {
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

    widget.addProduct(_product);
    Navigator.pushReplacementNamed(context, '/list');
  }

  TextFormField buildDescriptionTextField() {
    return TextFormField(
        decoration: InputDecoration(
          labelText: 'Description',
        ),
        keyboardType: TextInputType.multiline,
        maxLines: 4,
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
    return Container(
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
              child: Text('Add'),
              onPressed: _submitForm,
            )
          ],
        ),
      ),
    );
  }
}
