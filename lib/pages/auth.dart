import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authentication'),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  labelText: 'E-mail', hintText: 'sample@sample.com'),
              keyboardType: TextInputType.emailAddress,
              onChanged: (String value) {},
            ),
            SizedBox(
              height: 5.0,
            ),
            TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                keyboardType: TextInputType.text,
                obscureText: true,
                onChanged: (String value) {}),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              child: Text('Login'),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/list');
              },
            )
          ],
        ),
      ),
    );
  }
}
