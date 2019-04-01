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

  void _submitForm() {
    final Map<String, dynamic> product = {
      'title': _titleValue,
      'image': 'assets/food.jpg',
      'description': _descriptionValue,
      'price': _priceValue
    };
    widget.addProduct(product);
    Navigator.pushReplacementNamed(context, '/list');
  }

  TextField buildDescriptionTextField() {
    return TextField(
        decoration: InputDecoration(
          labelText: 'Description',
        ),
        keyboardType: TextInputType.multiline,
        maxLines: 4,
        onChanged: (String value) {
          setState(() {
            _descriptionValue = value;
          });
        });
  }

  TextField buildPriceTextField() {
    return TextField(
        decoration: InputDecoration(
          labelText: 'Price',
        ),
        keyboardType: TextInputType.number,
        onChanged: (String value) {
          setState(() {
            _priceValue = double.parse(value);
          });
        });
  }

  TextField buildTitleTextField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Title',
      ),
      onChanged: (String value) {
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
    );
  }
}
