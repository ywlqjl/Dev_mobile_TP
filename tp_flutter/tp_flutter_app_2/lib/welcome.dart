import 'package:flutter/material.dart';

class welcome extends StatelessWidget{

  final VoidCallback onSubmit_login;
  final VoidCallback onSubmit_register;

  const welcome({Key key, this.onSubmit_login, this.onSubmit_register}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return new Column(
      children: <Widget>[
        Text('Deliver features faster'),
        Text('Craft beautiful UIs'),
        Expanded(
          child: FittedBox(
            fit: BoxFit.contain, // otherwise the logo will be tiny
            child: const FlutterLogo(),
          ),
        ),

        new ListTile(
          title: RaisedButton(
            onPressed: onSubmit_login,
            child: Text('Login'),
          ),
        ),

        new ListTile(
          title: RaisedButton(
            onPressed: onSubmit_register,
            color: Colors.blue,
            textColor: Colors.white,
//            foregroundColor: Colors.white,
            child: Text('Register'),
          ),
        ),
      ],
    );
  }


}