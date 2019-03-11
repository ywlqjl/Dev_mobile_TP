import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';

class login extends StatelessWidget{

  const login({Key key, @required this.onSubmit, this.onRegister, }):super (key: key);

  final VoidCallback onSubmit;
  final VoidCallback onRegister;

  static final TextEditingController _email = new TextEditingController();
  static final TextEditingController _password = new TextEditingController();

  String get email => _email.text;
  String get password => _password.text;

  @override
  Widget build(BuildContext context) {

    return new Column(
      children: <Widget>[

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
            onPressed: onRegister,
            child: Text('Do not have an account yet?'),
          ),
        ),
      ],
    );
  }

}