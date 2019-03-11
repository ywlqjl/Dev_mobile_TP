//import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
//import 'package:flutter/foundation.dart';

//class login extends StatefulWidget{
//
//
//  const login({Key key, @required this.onSubmit, }):super (key: key);
//
//  final VoidCallback onSubmit;
//  static final TextEditingController _family_name = new TextEditingController();
//  static final TextEditingController _first_name = new TextEditingController();
//  static final TextEditingController _email = new TextEditingController();
//  static final TextEditingController _password = new TextEditingController();
//
//  String get familyname => _family_name.text;
//  String get firstname => _first_name.text;
//  String get email => _email.text;
//  String get password => _password.text;
//
//  @override
//  Widget build(BuildContext context) {
//
//    final _formKey = GlobalKey<FormState>();
//
//    return new Column(
//      children: <Widget>[
//        new ListTile(
//          leading: const Icon(Icons.person),
//          title: new TextFormField(
//            controller: _family_name,
//            validator: (value) {
//              if (value.isEmpty) {
//                return 'Please enter familyname';
//              }
//            },
//            decoration: new InputDecoration(
//              hintText: "Family name",
//            ),
//          ),
//        ),
//        new ListTile(
//          leading: const Icon(Icons.person),
//          title: new TextFormField(
//            controller: _first_name,
//            validator: (value) {
//              if (value.isEmpty) {
//                return 'Please enter firstname';
//              }
//            },
//            decoration: new InputDecoration(
//              hintText: "First name",
//            ),
//          ),
//        ),
//        new ListTile(
//          leading: const Icon(Icons.email),
//          title: new TextFormField(
//            controller: _email,
//            validator: (value) {
//              if (value.isEmpty) {
//                return 'Please enter email';
//              }
//            },
//            decoration: new InputDecoration(
//              hintText: "Email",
//            ),
//          ),
//        ),
//        new ListTile(
//          leading: const Icon(Icons.beenhere),
//          title: new TextFormField(
//            controller: _password,
//            validator: (value) {
//              if (value.isEmpty) {
//                return 'Please enter password';
//              }
//            },
//            decoration: new InputDecoration(
//              hintText: "Password",
//            ),
//            obscureText: true,
//          ),
//        ),
//        new ListTile(
//          title: RaisedButton(
//            onPressed: () {
//              // Validate will return true if the form is valid, or false if
//              // the form is invalid.
//              if (_formKey.currentState.validate()) {
//                // If the form is valid, we want to show a Snackbar
//                Scaffold.of(context).showSnackBar(
//                    SnackBar(content: Text('Processing Data')));
//                onSubmit;
//              }
//            },
//            child: Text('Enregistrer'),
//          ),
//        ),
//      ],
//    );
//  }
//
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return null;
//  }
//
//}

