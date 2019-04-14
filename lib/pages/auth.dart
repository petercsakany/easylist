import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  Map<String, dynamic> _formData = {
    'email': null,
    'password': null,
    'acceptTerms': false
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  SwitchListTile _buildTermsSwitch() {
    return SwitchListTile(
      title: Text('Accept Terms & Conditions'),
      value: _formData['acceptTerms'],
      onChanged: (bool value) {
        setState(() {
          _formData['acceptTerms'] = value;
        });
      },
    );
  }

  TextFormField _buildPasswordTextField() {
    return TextFormField(
        initialValue: 'H4b!t4t3',
        decoration: InputDecoration(
          labelText: 'Password',
          filled: true,
          fillColor: Colors.white,
        ),
        validator: (String input) {
          if (input.isEmpty ||
              !RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})")
                  .hasMatch(input)) {
            return "Enter a valid password.";
          }
        },
        keyboardType: TextInputType.text,
        obscureText: true,
        onSaved: (String value) {
          _formData['password'] = value;
        });
  }

  TextFormField _buildEmailTextField() {
    return TextFormField(
      initialValue: 'ppp@gmail.com',
      decoration: InputDecoration(
          labelText: 'E-mail',
          hintText: 'sample@sample.com',
          filled: true,
          fillColor: Colors.white),
      keyboardType: TextInputType.emailAddress,
      validator: (String input) {
        if (input.isEmpty ||
            !RegExp(r"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$")
                .hasMatch(input)) {
          return "Enter a valid e-mail address.";
        }
      },
      onSaved: (String value) {
        _formData['email'] = value;
      },
    );
  }

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      image: AssetImage("assets/background.jpg"),
      fit: BoxFit.cover,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
    );
  }

  void _submitForm() {
    if (!_formKey.currentState.validate() || !_formData['acceptTerms']) {
      return;
    }
    _formKey.currentState.save();
    Navigator.pushReplacementNamed(context, '/list');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authentication'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: _buildBackgroundImage(),
        ),
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _buildEmailTextField(),
                  SizedBox(
                    height: 10.0,
                  ),
                  _buildPasswordTextField(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _buildTermsSwitch(),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  RaisedButton(
                    child: Text('Login'),
                    onPressed: _submitForm,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
