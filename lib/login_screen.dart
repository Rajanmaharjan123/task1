import 'package:flutter/material.dart';
import 'validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.only(top: 10.0)),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        icon: Icon(Icons.person),
        hintText: 'you@example.com',
        labelText: 'Email Address ',
      ),
      validator: validateEmail,
      onSaved: (value) {
        email = value;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      //obscureText: false,
      decoration: InputDecoration(
        icon: Icon(Icons.person),
        hintText: 'Password',
        labelText: 'Password ',
      ),
      validator: validatePassword,
      onSaved: (value) {
        password = value;
      },
      //null if valid
    );
  }

  Widget submitButton() {
    return RaisedButton(
      color: Colors.lightBlueAccent,
      child: Text('Submit', style: TextStyle(fontSize: 20)),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print('time to post $email and $password to my api');
          //take both email and password
          //and post them to some api
        }
      },
    );
  }
}
