import 'package:flutter/material.dart';
import 'package:tp_flutter_app_2/settings.dart';
import 'package:tp_flutter_app_2/login.dart';
import 'package:tp_flutter_app_2/welcome.dart';
import 'package:tp_flutter_app_2/register.dart';
import 'package:tp_flutter_app_2/record.dart';

void main() => runApp(new MyApp());


class MyApp extends StatefulWidget{
  _MyAppState createState() => new _MyAppState();
}


class _MyAppState extends State<MyApp> {

  String _title = 'My App';
  Widget _screen;
  register _register;
  login _login;
  welcome _welcome;
  settings _settings;
  record _record;
  int _authenticated;

  _MyAppState(){
    _title = "My App";
//    _login = new login(onSubmit: (){onSubmit();});
    _login = new login(onSubmit: (){onSubmit();}, onRegister: (){toRegister();},);
    _settings = new settings();
    _welcome = new welcome(onSubmit_login: (){toLogin();}, onSubmit_register: (){toRegister();},);
    _register = new register(onSubmit: (){toRegister();}, onLogin: (){toLogin();},);
    _record = new record(onSubmit: (){onSubmit();},);
    _screen = _welcome;
    _authenticated = 0;
  }


  void _setAuthenticated(int auth){
    // 0-should login
    // 1-succeed in logging in.
    // else-should register
    setState(() {
      if(auth == 1){
        _screen = _settings;
        _title = 'Welcome';
        _authenticated = 1;
      }
      else if(auth == 0){
        _screen = _login;
        _title = 'Please login';
        _authenticated = 0;
      }
      else{
        _screen = _register;
        _title = 'Please register';
        _authenticated = 2;
      }
    });
  }

  void toLogin(){
    _setAuthenticated(0);
    _screen = _login;
  }

  void toRegister(){
    _setAuthenticated(2);
    _screen = _register;
  }

  void onSubmit(){
    print('login with' + _login.email + '' + _login.password);
    if(_login.email == 'yan@gmail.com' && _login.password == '123'){
      _setAuthenticated(1);
      _screen = _record;
    }
  }

  void _goHome(){
    print('go home $_authenticated');
    _title = "My App";

    setState(() {
      if(_authenticated == 1){
        _screen = _settings;
      }
      else{
        _screen = _welcome;
      }
    });
  }

  void _logout(){
    print('log out');
    _setAuthenticated(0);
  }

  void _userPage(){
    print('user page');
    _screen = _record;
  }


  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: 'Login Demo',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(_title),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.home), onPressed: _goHome),
            new IconButton(icon: new Icon(Icons.exit_to_app), onPressed: _logout),
          ],
        ),
        body: _screen,
      ),
    );
  }

}