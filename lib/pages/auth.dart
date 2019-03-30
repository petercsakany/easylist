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
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/background.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.dstATop),
          ),
        ),
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                      labelText: 'E-mail',
                      hintText: 'sample@sample.com',
                      filled: true,
                      fillColor: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (String value) {
                    setState(() {
                      _email = value;
                    });
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    onChanged: (String value) {
                      setState(() {
                        _password = value;
                      });
                    }),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SwitchListTile(
                    title: Text('Accept Terms & Conditions'),
                    value: _acceptTerms,
                    onChanged: (bool value) {
                      setState(() {
                        _acceptTerms = value;
                      });
                    },
                  ),
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
        ),
      ),
    );
  }
}
