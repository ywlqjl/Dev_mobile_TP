import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';

class register extends StatelessWidget{

  const register({Key key, @required this.onSubmit, this.onLogin, }):super (key: key);

  final VoidCallback onSubmit;
  final VoidCallback onLogin;
  static final TextEditingController _family_name = new TextEditingController();
  static final TextEditingController _first_name = new TextEditingController();
  static final TextEditingController _email = new TextEditingController();
  static final TextEditingController _password = new TextEditingController();

  String get familyname => _family_name.text;
  String get firstname => _first_name.text;
  String get email => _email.text;
  String get password => _password.text;

  @override
  Widget build(BuildContext context) {

    return new Column(
      children: <Widget>[
        new ListTile(
          leading: const Icon(Icons.person),
          title: new TextFormField(
            controller: _family_name,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter familyname';
              }
            },
            decoration: new InputDecoration(
              hintText: "Family name",
            ),
          ),
        ),
        new ListTile(
          leading: const Icon(Icons.person),
          title: new TextFormField(
            controller: _first_name,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter firstname';
              }
            },
            decoration: new InputDecoration(
              hintText: "First name",
            ),
          ),
        ),
        new ListTile(
          leading: const Icon(Icons.email),
          title: new TextFormField(
            controller: _email,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter email';
              }
            },
            decoration: new InputDecoration(
              hintText: "Email",
            ),
          ),
        ),
        new ListTile(
          leading: const Icon(Icons.beenhere),
          title: new TextFormField(
            controller: _password,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter password';
              }
            },
            decoration: new InputDecoration(
              hintText: "Password",
            ),
            obscureText: true,
          ),
        ),
        new ListTile(
          title: RaisedButton(
            onPressed: onSubmit,
//            onPressed: () {
            // Validate will return true if the form is valid, or false if
            // the form is invalid.
//              if (_formKey.currentState.validate()) {
//                // If the form is valid, we want to show a Snackbar
//                Scaffold.of(context).showSnackBar(
//                    SnackBar(content: Text('Processing Data')));
//                onSubmit;
//              }
//            },
            child: Text('Submit'),
          ),
        ),
        new ListTile(
          title: RaisedButton(
            onPressed: onLogin,
            child: Text('I have an account'),
          ),
        ),
      ],
    );
  }

}