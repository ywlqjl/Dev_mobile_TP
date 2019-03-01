//import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart'; // basic set of widgets
// When Dart is running the application, it calls to the main() function

main() => runApp( // The function runApp() starts the Flutter application
//  Text( // this is a widget, it renders the given text (think of it like a <span>)
//    'Hello, World!!!', // the first argument is a text that needs to be rendered
//    textDirection: TextDirection.ltr, // here we set the direction "left to right"
//
//  ),
//  new MyStatelessWidget
//    new GestureApp()
    new MyApp()
);



class MyStatelessWidget extends StatelessWidget {
// @override annotation is needed for optimization, by using it
// we say that we don't need the same method from the parent class // so the compiler can drop it


//  var text;

  @override
  Widget build(BuildContext context) {
  // I'll describe [context] later

  return Center(child: const Text( // this is a widget, it renders the given text (think of it like a <span>)
  'Hello, World!!!',
  // the first argument is a text that needs to be rendered
  textDirection: TextDirection.ltr, // here we set the direction "left to right"
  ));
  }

}



class GestureApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // I'll describe [context] later
      return Center(
        child: GestureDetector(
          onTap: (){
            print("OK");
          },
          child: Container(decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xFF17A288)),
            height: 108, width: 108,
          ),
        ),
      );
  }

}


//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//      title: 'Welcome to Flutter',
//      home: new Scaffold(
//        appBar: new AppBar(
//          title: new Text('Welcome to Flutter'),
//        ),
//        body: new Center(
//          child: new Text('Hello World'),
//        ),
//      ),
//    );
//  }
//}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Form Validation Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

// Create a Form Widget
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class. This class will hold the data related to
// the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  //
  // Note: This is a GlobalKey<FormState>, not a GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();
  final _id_usrname = GlobalKey<FormState>();
  final _id_pwd = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey we created above
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 20),

              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[


                  TextFormField(
                    key: _id_usrname,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter usrname';
                      }
                    },),

                  TextFormField(
                    key: _id_pwd,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter password';
                      }
                    },),

                  RaisedButton(
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_formKey.currentState.validate()) {
                        // If the form is valid, we want to show a Snackbar
                        Scaffold.of(context)
                            .showSnackBar(SnackBar(content: Text('Processing Data')));
                      }
                    },
                    child: Text('Submit'),
                  ),

                ],)

          ),
        ],
      ),
    );
  }
}

/// Single-line text field widget
class SingleLineTextFieldWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 20),
//      decoration: BoxDecoration(
//        border: Border.all(color: Colors.grey),
//        borderRadius: BorderRadius.all(Radius.circular(10.0)),
//      ),
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter some text';
          }
        },
        autocorrect: false, // turns off auto-correct
//        decoration: InputDecoration(
//          hintText: 'Enter text; return submits',
//        ),
//        onChanged: (str) => print('Single-line text change: $str'),
//        onSubmitted: (str) => _showInSnackBar(context, '$str'),
      ),
    );
  }
}

/// Displays text in a snackbar
_showInSnackBar(BuildContext context, String text) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text(text),
  ));
}