import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePage();
  }
}

class _ProductCreatePage extends State<ProductCreatePage> {
  String titleValue = '';
  String descriptionValue = '';
  double priceValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView(children: <Widget>[
        TextField(
          decoration: InputDecoration(
            labelText: 'Title', 
            border: OutlineInputBorder()),
          onChanged: (String value) {
          setState(() {
           titleValue = value; 
          });
        },),
        TextField(
          decoration: InputDecoration(
            labelText: 'Price',
            border: OutlineInputBorder()),
          keyboardType: TextInputType.number,
          onChanged: (String value) {
          setState(() {
           priceValue = double.parse(value); 
          });
        }
        ),
        TextField(
          decoration: InputDecoration(
            labelText: 'Description',
            border: OutlineInputBorder()),
          keyboardType: TextInputType.multiline,
          maxLines: 4,
          onChanged: (String value) {
          setState(() {
           descriptionValue = value; 
          });
        }
        ),
        RaisedButton(
          child: Text('Save'),
          onPressed: () {
            
          },
        )
      ],),
    );
  }
}
