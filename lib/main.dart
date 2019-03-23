import 'package:flutter/material.dart';

import './products_manager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //primarySwatch: Colors.amber
        //brightness: Brightness.dark
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Easylist'),
        ),
        body: ProductManager(),
      ),
    );
  }
}
