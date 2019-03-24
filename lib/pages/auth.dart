import 'package:flutter/material.dart';

import '../pages/product_list.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authentication'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Login'),
          onPressed: () => {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ProductListPage()))
              },
        ),
      ),
    );
  }
}
