import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';

class record extends StatelessWidget{

  const record({Key key, this.onSubmit,}):super (key: key);

  final VoidCallback onSubmit;
  static final TextEditingController _nom_medicament = new TextEditingController();
  static final TextEditingController _date = new TextEditingController();
  static final TextEditingController _password = new TextEditingController();

  String get nomMedicament => _nom_medicament.text;
  String get date => _date.text;
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new ListTile(
          leading: const Icon(Icons.person),
          title: new TextFormField(
            controller: _nom_medicament,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter the drug name';
              }
            },
            decoration: new InputDecoration(
              hintText: "Drug name",
            ),
          ),
        ),

        new ListTile(
          leading: const Icon(Icons.email),
          title: new TextFormField(
            controller: _date,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter date';
              }
            },
            decoration: new InputDecoration(
              hintText: "Date",
            ),
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
      ],
    );
  }
}