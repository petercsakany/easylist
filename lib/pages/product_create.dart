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
  String _titleValue = '';
  String _descriptionValue = '';
  double _priceValue = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submitForm() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    final Map<String, dynamic> product = {
      'title': _titleValue,
      'image': 'assets/food.jpg',
      'description': _descriptionValue,
      'price': _priceValue
    };
    widget.addProduct(product);
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
          setState(() {
            _descriptionValue = value;
          });
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
          setState(() {
            _priceValue = double.parse(value);
          });
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
        setState(() {
          _titleValue = value;
        });
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
              child: Text('Save'),
              onPressed: _submitForm,
            )
          ],
        ),
      ),
    );
  }
}
