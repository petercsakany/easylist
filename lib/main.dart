import 'package:flutter/material.dart';

import './pages/auth.dart';
import './pages/product_list.dart';
import './pages/product_admin.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //primarySwatch: Colors.amber
        //brightness: Brightness.dark
      ),
      home: AuthPage(),
      routes: {
        '/list' : (BuildContext context) => ProductListPage(),
        '/admin' : (BuildContext context) => ProductAdminPage(),
      },
    );
  }
}
