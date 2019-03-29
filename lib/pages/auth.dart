import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  String _email;
  String _password;
  bool _acceptTerms = false;

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
              onChanged: (String value) {
                setState(() {
                  _email = value;
                });
              },
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
                onChanged: (String value) {
                  setState(() {
                    _password = value;
                  });
                }),
                SwitchListTile(
                  title: Text('Accept Terms & Conditions'),
                  value: _acceptTerms,
                  onChanged: (bool value) {
                    setState(() {
                     _acceptTerms = value; 
                    });
                    print(_acceptTerms);
                  },
                ),
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
