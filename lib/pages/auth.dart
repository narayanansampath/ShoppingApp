import 'package:flutter/material.dart';


class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }

}

class _AuthPageState extends State<AuthPage> {
  String _emailValue;
  String _passwordValue;
  bool _acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: 'Email',
            ),
            onChanged: (String value) {
              setState(() {
                _emailValue = value;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Password',
            ),
            onChanged: (String value) {
              setState(() {
                _passwordValue = value;
              });
            },
            obscureText: true,
          ),
          SwitchListTile(
            value: _acceptTerms,
            onChanged: (bool value) {
              setState(() {
                _acceptTerms = value;
              });
            },
            title: Text('Accept Terms'),
          ),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
            child: Text('Login'),
            color: Theme.of(context).accentColor,
            textColor: Colors.white,
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
    );
  }
}
