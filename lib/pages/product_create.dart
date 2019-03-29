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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
                labelText: 'Title',),
            onChanged: (String value) {
              setState(() {
                _titleValue = value;
              });
            },
          ),
          SizedBox(
            height: 5.0,
          ),
          TextField(
              decoration: InputDecoration(
                  labelText: 'Price',),
              keyboardType: TextInputType.number,
              onChanged: (String value) {
                setState(() {
                  _priceValue = double.parse(value);
                });
              }),
          SizedBox(
            height: 5.0,
          ),
          TextField(
              decoration: InputDecoration(
                  labelText: 'Description',),
              keyboardType: TextInputType.multiline,
              maxLines: 4,
              onChanged: (String value) {
                setState(() {
                  _descriptionValue = value;
                });
              }),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
            child: Text('Save'),
            onPressed: () {
              final Map<String, dynamic> product = {
                'title': _titleValue,
                'image': 'assets/food.jpg',
                'description': _descriptionValue,
                'price': _priceValue
              };
              widget.addProduct(product);
              Navigator.pushReplacementNamed(context, '/list');
            },
          )
        ],
      ),
    );
  }
}
